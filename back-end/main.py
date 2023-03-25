from flask import Flask, render_template, request, url_for, redirect, send_file, jsonify
from flask_cors import CORS, cross_origin
from connection import connect, connects

app = Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'

# api for feature 1
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

# api for feature 2
@app.route('/grt_n', methods=['POST'])
def grt_n():
    if request.method == 'POST':
        n_ratings = request.get_json()
        data = connect("WHERE avg_rate > %.1f" % (n_ratings['n']))
        return jsonify(data)

# api for feature 3
@app.route('/by_director', methods=['POST'])
def by_director():
    if request.method == 'POST':
        director = request.get_json()
        data = connect("WHERE id IN (SELECT mid FROM Director JOIN Direction ON id = did WHERE first_name = %s and surname = %s" % (director['first_name'], director['surname']))
        return jsonify(data)

# api for feature 4
@app.route('/top_n', methods=['POST'])
def top_n():
    if request.method == 'POST':
        n_ratings = request.get_json()
        data = connects("SELECT * FROM (SELECT name, RANK() OVER (ORDER BY (avg_rate) DESC) AS r FROM Movie) AS T WHERE r <= %d" % (n_ratings['n']))
        return jsonify(data)

# api for feature 5
@app.route('/add_review', methods=['POST'])
def add_review():
    if request.method == 'POST':
        reviews = request.get_json()
        result = ""
        if (connect("SELECT * FROM Rating WHERE WHERE rid = %d, mid = %d" % (reviews['rid'], reviews['mid']))):
        # if review already exists
            connect("UPDATE Rating SET rate = %.1f, comment = %s WHERE rid = %d, mid = %d" % (reviews['rating'], reviews['comment'], reviews['rid'], reviews['mid']))
            result = "Comment updated"
        else:
            connect("INSERT INTO Rating values (%d, %d, %.1f, %s)" % (reviews['rid'], reviews['mid'], reviews['rating'], reviews['comment']))
            result = "Comment added"
        return jsonify(result)


if __name__ == '__main__':
    app.run(port=8080, debug=False)