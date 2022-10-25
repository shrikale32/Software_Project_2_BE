from flask import Flask, request, jsonify
from flask_cors import CORS
from content import *

app = Flask(__name__)

CORS(app)


@app.route('/', methods=['GET', 'POST'])
def home():
    return "Flask Backend is running successfully!"

@app.route('/CreateContent', methods=['POST'])
def createContent():
    contentData = request.get_json(force=True)
    contentId = addContent(contentData)
    return str(contentId)

@app.route('/UpdateContent', methods=['POST'])
def editContent():
    contentData = request.get_json(force=True)
    contentId = updateContent(contentData)
    return str(contentId)

@app.route('/<string:contentId>/DeleteContent', methods=['GET'])
def removeContent(contentId):
    print(contentId)
    response = deleteContent(contentId)
    return str(response)

if __name__ == '__main__':
    app.run(debug=True)