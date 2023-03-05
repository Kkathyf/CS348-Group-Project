from flask import Flask, render_template, request, url_for, redirect, send_file, jsonify
from connection import connect

app = Flask(__name__)


@app.route("/", methods=['POST', 'GET'])
def main():
    db = connect()
    if request.method == 'GET':
        data = {'message': 'Hello, React!'}
        return jsonify(data)
    elif request.method == 'POST':
        data = request.json
        return format(data)


if __name__ == '__main__':
    app.run(debug=False)