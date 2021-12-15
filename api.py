from flask import Flask,request,jsonify
from sklearn.preprocessing import OneHotEncoder,StandardScaler
from sklearn.pipeline import make_pipeline
from sklearn.compose import make_column_transformer
import pandas as pd
from joblib import load
app = Flask(__name__)   # Flask constructor
  
# A decorator used to tell the application
# which URL is associated function
@app.route('/')      
def hello():
    return 'HELLO'
@app.route('/predict_price',methods=['GET'])
def predict_price():
    total=request.args.get('location')
    bath=float(request.args.get('bath'))
    balcony=float(request.args.get('balcony'))
    bhk=int(request.args.get('bhk'))
    sqft=float(request.args.get('sqft'))
    response = jsonify({
        'estimated_price': price_prediction_model(total,bath,balcony,bhk,sqft)
    })
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response
def price_prediction_model(a,b,c,d,e):
    features = [a,b,c,d,e]
    features2=pd.DataFrame([features])
    features2.columns =['location','bath','balcony','bhk','sqft']
    pipe=load('House_predictor_banglore2.joblib')
    ans = float(pipe.predict(features2))
    print(ans)
    return round(ans,2)

if __name__=='__main__':
   app.run(debug=True)