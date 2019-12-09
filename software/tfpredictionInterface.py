import functools
from pathlib import Path
import logging
import sys
import time
import pandas as pd
import numpy as np
import numpy
import csv
import os

import pyrebase

import tensorflow as tf

PLASTICTYPES = ["none","PET","HDPE","PVC","LDPE","PP","PS"]

#gets most recent estimator model
export_dir = 'dnn_estimator'
subdirs = [x for x in Path(export_dir).iterdir()
           if x.is_dir() and 'temp' not in str(x)]
latest = str(sorted(subdirs)[-1])

#imports model which was previously exported in tfestimator.py
imported = tf.saved_model.load(latest)
    
NUMERIC_FEATURES = ['wavelength1','wavelength2','wavelength3','wavelength4','wavelength5','wavelength6','wavelength7','wavelength8', 'wavelength9','wavelength10','wavelength11','wavelength12','wavelength13','wavelength14']

def predict_input_fn(data):
    df_data = pd.DataFrame(dict(zip(NUMERIC_FEATURES, data)), index=[1])
    # remove NaN elements
    df_data = df_data.dropna(how='any', axis=0)

    return tf.compat.v1.estimator.inputs.pandas_input_fn(
        x=df_data,
        num_epochs=1,
        shuffle=False
    )

def predict(x):
  x =  np.asarray(x)
  tensors = tf.convert_to_tensor(x)
  tensors = tf.cast(tensors, tf.float32)
  return imported.signatures["predict"](
      wavelength1=tensors[0],
      wavelength2=tensors[1],
      wavelength3=tensors[2],
      wavelength4=tensors[3],
      wavelength5=tensors[4],
      wavelength6=tensors[5],
      wavelength7=tensors[6],
      wavelength8=tensors[7],
      wavelength9=tensors[8],
      wavelength10=tensors[9],
      wavelength11=tensors[10],
      wavelength12=tensors[11],
      wavelength13=tensors[12],
      wavelength14=tensors[13]
      )


config = {
  #insert your firebase config here
}

firebase = pyrebase.initialize_app(config)

db = firebase.database()
#id of your device within the firebase
device_id = "1234567"
#stream handler listening to firebase changes
def stream_handler(callback):
    if callback["event"] == 'patch':
        if callback["path"] == "/":
            if callback["data"].get('predictID') != None:
                detectAndUpload()
controlStream = db.child("devices").child(device_id).child("control").stream(stream_handler)

#downloads data from firebase, calculates the derivates and makes an prediction which is converted to a plastic type.
#this should be modified to use the methods mentioned in the paper linked in readme.md
#data is finally uploaded to firebase
def detectAndUpload():
    recentID = db.child("devices").child(device_id).child("control").child("predictID").child("name").get()
    recentID = recentID.val()
    recentScan = db.child("devices").child(device_id).child("detection").child("measurements").child(str(recentID)).get()

    recentScan = recentScan.val()
    wavelengths = []

    wavelengths.append(int(recentScan['white']))
    wavelengths.append(int(recentScan['nm850']))
    wavelengths.append(int(recentScan['nm940']))
    wavelengths.append(int(recentScan['nm1200']))
    wavelengths.append(int(recentScan['nm1300']))
    wavelengths.append(int(recentScan['nm1450']))
    wavelengths.append(int(recentScan['nm1550']))
    wavelengths.append(int(recentScan['nm1650']))
    wavelengths.append((wavelengths[2] - wavelengths[1])/(940-850))
    wavelengths.append((wavelengths[3] - wavelengths[2])/(1200-940))
    wavelengths.append((wavelengths[4] - wavelengths[3])/(1300-1200))
    wavelengths.append((wavelengths[5] - wavelengths[4])/(1450-1300))
    wavelengths.append((wavelengths[6] - wavelengths[5])/(1550-1450))
    wavelengths.append((wavelengths[7] - wavelengths[6])/(1650-1550))

    if len(wavelengths) > 14:
        wavelengths = wavelengths[14:]

    data = convertPredictionToPlasticType(predict(wavelengths))
    db.child("devices").child(device_id).child("detection").child("measurements").child(str(recentID)).update(data)

#input: tf prediction object 
#output: readable plastic type and plastic id
def convertPredictionToPlasticType(prediction):
    prediction = dict(prediction)
    prediction_array = { key:value for key,value in prediction.items() if key in {'class_ids'}}
    PlasticID = int(prediction_array.get('class_ids').numpy()[0][0])
    prediction_array = { key:value for key,value in prediction.items() if key in {'probabilities'}}
    PlasticAccuracy = int(prediction_array.get('probabilities').numpy()[0][PlasticID])

    PlasticType = PLASTICTYPES[PlasticID]
    print("Type: " + PlasticType + "; Probability: " + str(PlasticAccuracy))
    return {"PlasticType": PlasticType, "PlasticID": PlasticID}
