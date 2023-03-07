from flask import Flask, render_template, request, url_for, redirect, send_file, jsonify
from flask_cors import CORS, cross_origin
from connection import connect

app = Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'


@app.route("/", methods=['POST', 'GET'])
def main():
    if request.method == 'GET':
        data = connect('')
        # print(jsonify(data))
        return jsonify(data)
    elif request.method == 'POST':
        searchTerm = request.get_json()
        data = connect("WHERE name LIKE '%" + searchTerm['data'] + "%'")
        print(data)
        return jsonify(data)


if __name__ == '__main__':
    app.run(debug=False)