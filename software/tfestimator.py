from __future__ import absolute_import, division, print_function, unicode_literals

import numpy as np
import pandas as pd
from IPython.display import clear_output
from matplotlib import pyplot as plt
import time
from sklearn.model_selection import train_test_split

#importing the edited dataset into a dataframe
dataframe = pd.read_csv('../data/training_scans/20191127/data_corrected20191127-124343.csv')

import tensorflow as tf
tf.random.set_seed(123)

#splitting the data into test sets
dftrain, dfeval = train_test_split(dataframe, test_size=0.1)
print(len(dftrain), 'train examples')
print(len(dfeval), 'validation examples')

y_train = dftrain.pop('PlasticType')
y_eval = dfeval.pop('PlasticType')


dftrain.head()

dftrain.describe()

dftrain.shape[0], dfeval.shape[0]

fc = tf.feature_column
NUMERIC_FEATURES = ['wavelength1','wavelength2','wavelength3','wavelength4','wavelength5','wavelength6','wavelength7','wavelength8', 'wavelength9','wavelength10','wavelength11','wavelength12','wavelength13','wavelength14']
feature_columns = []

for feature_name in NUMERIC_FEATURES:
  feature_columns.append(tf.feature_column.numeric_column(feature_name,
                                           dtype=tf.float32))

example = dict(dftrain.head(1))
tf.keras.layers.DenseFeatures(feature_columns)(example).numpy()

# Use entire batch since this is such a small dataset.
NUM_EXAMPLES = len(y_train)

def make_input_fn(X, y, n_epochs=None, shuffle=True):
  def input_fn():
    dataset = tf.data.Dataset.from_tensor_slices((dict(X), y))
    if shuffle:
      dataset = dataset.shuffle(NUM_EXAMPLES)
    # For training, cycle thru dataset as many times as need (n_epochs=None).
    dataset = dataset.repeat(n_epochs)
    # In memory training doesn't use batching.
    dataset = dataset.batch(NUM_EXAMPLES)
    return dataset
  return input_fn

# Training and evaluation input functions.
train_input_fn = make_input_fn(dftrain, y_train)
eval_input_fn = make_input_fn(dfeval, y_eval, shuffle=False, n_epochs=10)

# Since data fits into memory, use entire dataset per layer. It will be faster.
# Above one batch is defined as the entire dataset.
model = tf.estimator.DNNClassifier(hidden_units=[80,40],feature_columns=feature_columns, n_classes=7)
start = time.time()
model.train(input_fn=train_input_fn, steps=15000)
end = time.time() 
time = end - start
result = model.evaluate(eval_input_fn)

clear_output()

print(str(time) + ' s')
print(pd.Series(result))

d = [12571,170078,244506,146952,143949,159136,123893,104708,826.9777777777778,-375.2076923076923,-30.03,101.24666666666667,-352.43,-191.85
]

def predict_input_fn(data):
    df_data = pd.DataFrame(dict(zip(NUMERIC_FEATURES, data)), index=[1])
    # remove NaN elements
    df_data = df_data.dropna(how='any', axis=0)

    return tf.compat.v1.estimator.inputs.pandas_input_fn(
        x=df_data,
        num_epochs=1,
        shuffle=False
    )

predictions = model.predict( input_fn=predict_input_fn(d) )

for result in predictions:
  print( 'result: {}'.format(result))

print(feature_columns)

def serving_input_receiver_fn():
  """Serving input_fn that builds features from placeholders
  Returns
  -------
  tf.estimator.export.ServingInputReceiver
  """
  wavelength1 = tf.compat.v1.placeholder(dtype=tf.float32, shape=[1,1], name='wavelength1')
  wavelength2 = tf.compat.v1.placeholder(dtype=tf.float32, shape=[1,1], name='wavelength2')
  wavelength3 = tf.compat.v1.placeholder(dtype=tf.float32, shape=[1,1], name='wavelength3')
  wavelength4 = tf.compat.v1.placeholder(dtype=tf.float32, shape=[1,1], name='wavelength4')
  wavelength5 = tf.compat.v1.placeholder(dtype=tf.float32, shape=[1,1], name='wavelength5')
  wavelength6 = tf.compat.v1.placeholder(dtype=tf.float32, shape=[1,1], name='wavelength6')
  wavelength7 = tf.compat.v1.placeholder(dtype=tf.float32, shape=[1,1], name='wavelength7')
  wavelength8 = tf.compat.v1.placeholder(dtype=tf.float32, shape=[1,1], name='wavelength8')
  wavelength9 = tf.compat.v1.placeholder(dtype=tf.float32, shape=[1,1], name='wavelength9')
  wavelength10 = tf.compat.v1.placeholder(dtype=tf.float32, shape=[1,1], name='wavelength10')
  wavelength11 = tf.compat.v1.placeholder(dtype=tf.float32, shape=[1,1], name='wavelength11')
  wavelength12 = tf.compat.v1.placeholder(dtype=tf.float32, shape=[1,1], name='wavelength12')
  wavelength13 = tf.compat.v1.placeholder(dtype=tf.float32, shape=[1,1], name='wavelength13')
  wavelength14 = tf.compat.v1.placeholder(dtype=tf.float32, shape=[1,1], name='wavelength14')
  receiver_tensors = {
    'wavelength1': wavelength1,
    'wavelength2': wavelength2,
    'wavelength3': wavelength3,
    'wavelength4': wavelength4,
    'wavelength5': wavelength5,
    'wavelength6': wavelength6,
    'wavelength7': wavelength7,
    'wavelength8': wavelength8,
    'wavelength9': wavelength9,
    'wavelength10': wavelength10,
    'wavelength11': wavelength11,
    'wavelength12': wavelength12,
    'wavelength13': wavelength13,
    'wavelength14': wavelength14
  }
  features = receiver_tensors
  return tf.estimator.export.ServingInputReceiver(features, receiver_tensors)

#exports the model
model.export_saved_model('dnn_estimator', serving_input_receiver_fn)