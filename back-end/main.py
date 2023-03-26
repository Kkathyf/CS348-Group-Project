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
        # review json content
        # reviews['rname']: reviewer name
        # reviews['mid']: movie id
        # reviews['rating']: rating, a number
        # reviews['comment']: string
        reviews = request.get_json()
        result = ""
        reviewer = connects(f"SELECT * FROM Reviewer WHERE username = \"{reviews['rname']}\"")
        # if reviewer exists
        rid = 0
        if not reviewer:
            # reviewer not exists
            connects(f"INSERT INTO Reviewer (username, num_of_ratings) VALUES (\"{reviews['rname']}\", 0)")
        else:
            rid = reviewer[0][0]
        if (connects("SELECT * FROM Rating WHERE rid = %d AND mid = %d" % (reviews['rid'], reviews['mid']))):
        # if review already exists
            connects("UPDATE Rating SET rate = %.1f, comment = %s WHERE rid = %d, mid = %d" % (reviews['rating'], reviews['comment'], reviews['rid'], reviews['mid']))
            result = "Comment updated"
        else:
            connects("INSERT INTO Rating values (%d, %d, %.1f, %s)" % (rid, reviews['mid'], reviews['rating'], reviews['comment']))
            result = "Comment added"
        return jsonify(result)

# feature for updating rating
@app.route('/update_review', methods=['POST'])
def update_review():
    if request.method == 'POST':
        # review json content
        # reviews['rid']: reviewer id
        # reviews['mid']: movie id
        # reviews['rating']: rating, a number
        # reviews['comment']: string
        reviews = request.get_json()
        connects("UPDATE Rating SET rate = %.1f, comment = %s WHERE rid = %d, mid = %d" % (reviews['rating'], reviews['comment'], reviews['rid'], reviews['mid']))
        result = "Update success"
        return jsonify(result)


if __name__ == '__main__':
    app.run(port=8080, debug=False)