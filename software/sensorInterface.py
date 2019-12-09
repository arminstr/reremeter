import serial
import struct
import re
import numpy
import csv
import time
import os

import pyrebase

import tensorflow as tf

PLASTICTYPES = ["PET","HDPE","PVC","LDPE","PP","PS"]
wavelength_correction = [10887,	162684,	224906,	134547,	113060,	135121,	101445,	78442]

config = {
  #insert your firebase config here
}

#id of your device within the firebase
device_id = "1234567"

firebase = pyrebase.initialize_app(config)

db = firebase.database()
measure = False

#stream handler listening to firebase changes
def stream_handler(callback):
    global measure
    if callback["path"] == "/":
        if callback["data"] == {'measure': 'true'}:
            measure = True
        if callback["data"] == 'true':
            measure = True
controlStream = db.child("devices").child(device_id).child("control").stream(stream_handler)

#open the serial to the device
ser = serial.Serial('/dev/tty.usbmodem205231794B411') 
#print(ser.name)
measurements = []

while 1:
    if ser.is_open == False:
        ser.open()
    ser.flushInput()
    ser.flush()
    
    #wait for firebase command to enable a single measurement
    if measure == True:
        start = time.time()

        ser.write(b'CMD=1')
        #byte_array = ser.readline()
        string_array = str(ser.readline(), 'utf-8')

        if string_array.startswith("CMD=OK"):
            transmission_started  = True
            #print('Measurement started...')

            for x in range(0, 3):
                string_array = str(ser.readline(), 'utf-8')
                if string_array.startswith("MEASURE=PRE"):
                    measurement_type = "PRE"
                if string_array.startswith("MEASURE=VALUE"):
                    measurement_type = "VALUE"
                if string_array.startswith("MEASURE=POST"):
                    measurement_type = "POST"
            
                num_array = re.findall('\d+', string_array) #find all integers
                measurements.append([0,0,0,num_array[0], num_array[1], num_array[2], num_array[3], num_array[4], num_array[5], num_array[6], num_array[7]]) #store an array to write to the csv file
                if len(measurements) > 3:
                    measurements = measurements[3:]
                    
            
            string_array = str(ser.readline(), 'utf-8')
            if string_array.startswith("MEASURE=FINISH"):
                end = time.time()  

                wavelengths = []
                for y in range(0, 8):
                    j = y+3
                    wavelengths.insert(y, int(round(int(measurements[1][j]) - (int(measurements[0][j]) + int(measurements[2][j]))/2))- wavelength_correction[y])
                
                measurements_corrected = [
                    wavelengths[0],
                    wavelengths[1],
                    wavelengths[2],
                    wavelengths[3],
                    wavelengths[4],
                    wavelengths[5],
                    wavelengths[6],
                    wavelengths[7],
                    (wavelengths[2] - wavelengths[1])/(940-850),
                    (wavelengths[3] - wavelengths[2])/(1200-940),
                    (wavelengths[4] - wavelengths[3])/(1300-1200),
                    (wavelengths[5] - wavelengths[4])/(1450-1300),
                    (wavelengths[6] - wavelengths[5])/(1550-1450),
                    (wavelengths[7] - wavelengths[6])/(1650-1550)
                ]
                measurements_upload = [
                    wavelengths[0],
                    wavelengths[1],
                    wavelengths[2],
                    wavelengths[3],
                    wavelengths[4],
                    wavelengths[5],
                    wavelengths[6],
                    wavelengths[7]
                    ]          
                
                #calculate measurement time
                time_ms = int(round((end - start)*1000)) 

                data = {"white": str(measurements_upload[0]),
                        "nm850": str(measurements_upload[1]),
                        "nm940": str(measurements_upload[2]),
                        "nm1200": str(measurements_upload[3]),
                        "nm1300": str(measurements_upload[4]),
                        "nm1450": str(measurements_upload[5]),
                        "nm1550": str(measurements_upload[6]),
                        "nm1650": str(measurements_upload[7])
                }

                #upload new measurement to firebase
                itemid = db.child("devices").child(device_id).child("detection").child("measurements").push(data)
                
                data = {"predictID": itemid}
                db.child("devices").child(device_id).child("control").update(data)

                data = {"measure": "false"}
                db.child("devices").child(device_id).child("control").update(data)

                
                print(str(time_ms) + ' ms')
                #print('Measurement successfully stored!')
                measure = False
    ser.close()