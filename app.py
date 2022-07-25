from flask import Flask, request, jsonify, render_template
from flask.logging import create_logger
import logging

import pandas as pd
from sklearn.externals import joblib
# import joblib
from sklearn.preprocessing import StandardScaler

app = Flask(__name__)
LOG = create_logger(app)
LOG.setLevel(logging.INFO)

def scale(payload):
    """Scales Payload"""
    
    LOG.info(f"Scaling Payload: \n{payload}")
    scaler = StandardScaler().fit(payload.astype(float))
    scaled_adhoc_predict = scaler.transform(payload.astype(float))
    return scaled_adhoc_predict

@app.route("/")
def home():
    return render_template('form.html')

@app.route("/predict", methods=['POST', 'GET'])
def predict():
    """Performs an sklearn prediction
        
        input looks like:
        {
        "CHAS":{
        "0":0
        },
        "RM":{
        "0":6.575
        },
        "TAX":{
        "0":296.0
        },
        "PTRATIO":{
        "0":15.3
        },
        "B":{
        "0":396.9
        },
        "LSTAT":{
        "0":4.98
        }
        
        result looks like:
        { "prediction": [ <val> ] }
        
        """
    if request.method == 'GET':
        return "The URL is directly inaccessible. Go to '/' to submit a form first"
    if request.method == 'POST':
        firstInput = request.form.get('PTRATIO')
        secondInput = request.form.get('TAX')
        otherInput = request.form.get('OTHERS')
        
        # Set custom payload
        json_payload = {
        "CHAS":{
        "0":0
        },
        "RM":{
        "0":6.575
        },
        "TAX":{
        "0":296.0
        },
        "PTRATIO":{
        "0":15.3
        },
        "B":{
        "0":396.9
        },
        "LSTAT":{
        "0":4.98
        }}
        LOG.info(f"first JSON payload: \n{json_payload}")

        # modify values 
        json_payload['CHAS']["0"] = (json_payload['CHAS']["0"])*float(otherInput)
        json_payload['RM']["0"] = (json_payload['RM']["0"])*float(otherInput)
        json_payload['B']["0"] = (json_payload['B']["0"])*float(otherInput)
        json_payload['LSTAT']["0"] = (json_payload['LSTAT']["0"])*float(otherInput)
        json_payload['PTRATIO']["0"] = (json_payload['PTRATIO']["0"])*float(firstInput)
        json_payload['TAX']["0"] = (json_payload['TAX']["0"])*float(secondInput)

        LOG.info(f"modified JSON payload: \n{json_payload}")
        inference_payload = pd.DataFrame(json_payload)
        LOG.info(f"Inference payload DataFrame: \n{inference_payload}")

        # scale the input
        scaled_payload = scale(inference_payload)
        
        # get an output prediction from the pretrained model, clf
        prediction = list(clf.predict(scaled_payload))

        # TO DO:  Log the output prediction value
        LOG.info(f"Predicted Value: \n{prediction}")
        # return jsonify({'prediction': prediction})

        # show result in html 
        return render_template('data.html',prediction = prediction)

if __name__ == "__main__":
    # load pretrained model as clf
    clf = joblib.load("./model_data/boston_housing_prediction.joblib")
    app.run(host='0.0.0.0', port=80, debug=True) # specify port=80
