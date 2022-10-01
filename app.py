from flask import Flask
from flask_cors import CORS

app = Flask(__name__)

CORS(app)


@app.route('/', methods=['GET', 'POST'])
def home():
    return "Flask Backend is running successfully!"

if __name__ == '__main__':
    app.run(debug=True)