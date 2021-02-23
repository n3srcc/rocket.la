from flask import Flask
from flask import jsonify
from flask import request
import pandas as pd

app = Flask(__name__)

@app.route('/api/v1/pokemons', methods=['GET'])
def get_pokemons(): 
    df = pd.read_csv('twoslotgroundpokemons.csv', names=['name', 'url', 'slot'])
    get_filter = request.args.get('filter')
    
    if get_filter:
        df = df[df['name'].str.contains(get_filter)]
        
    json_data = df.to_json(orient='records')
    return jsonify(json_data)

if __name__ == "__main__": 
    app.run(host='0.0.0.0', port=8089)