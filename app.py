from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
import logging

logging.basicConfig(level=logging.DEBUG)

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://user:password@database-service.default.svc.cluster.local:5432/dbname'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Movie(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    director = db.Column(db.String(100), nullable=False)
    year = db.Column(db.Integer, nullable=False)

@app.before_first_request
def create_tables():
    db.create_all()
    if Movie.query.count() == 0:
        movies = [
            Movie(title="Inception", director="Christopher Nolan", year=2010),
            Movie(title="The Matrix", director="Lana Wachowski, Lilly Wachowski", year=1999),
            Movie(title="Interstellar", director="Christopher Nolan", year=2014),
            Movie(title="Parasite", director="Bong Joon Ho", year=2019),
            Movie(title="The Shawshank Redemption", director="Frank Darabont", year=1994),
            Movie(title="Pulp Fiction", director="Quentin Tarantino", year=1994),
            Movie(title="The Godfather", director="Francis Ford Coppola", year=1972),
            Movie(title="The Dark Knight", director="Christopher Nolan", year=2008),
            Movie(title="Schindler's List", director="Steven Spielberg", year=1993),
            Movie(title="Fight Club", director="David Fincher", year=1999)
        ]
        db.session.bulk_save_objects(movies)
        db.session.commit()

        
@app.errorhandler(Exception)
def handle_exception(e):
    app.logger.error(f"An unexpected error occurred: {e}")
    return jsonify({"error": "An unexpected error occurred"}), 500

@app.route('/')
def home():
    movies = Movie.query.all()
    movies_list = [{"title": movie.title, "director": movie.director, "year": movie.year} for movie in movies]
    return jsonify(movies_list)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8001, debug=True)

