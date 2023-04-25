import json
import functions_framework
from flask import Flask, request, jsonify
from flask_cors import CORS,cross_origin

import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from datetime import datetime

app = Flask(__name__)
CORS(app,origins='*')
fireApp = firebase_admin.initialize_app()
db = firestore.client()




students_ref = db.collection(u'students')
posts_ref = db.collection(u'posts')
mail_ref = db.collection(u'mail')

@cross_origin()
@functions_framework.http
def social_media(request):
    if request.method == 'POST' and request.path == '/users':
        return create_profile()
    elif request.method == 'POST' and request.path == '/login':
        return login()
    elif request.method == 'GET' and request.path == '/users':
        return get_profile()
    elif request.method == 'PATCH':
        email = request.path.split('/')[-1]
        return edit_profile(email)
    elif request.method == 'POST' and request.path == '/post':
        return create_post()


@app.route('/login', methods=['POST'])
def login():
    login_cred = json.loads(request.data)
    email = login_cred['email']
    password = login_cred['password']

    docs = students_ref.where(u'email', u'==', email).stream()
   
    for doc in docs:
        userEmail = doc.to_dict()['email']
        if doc.to_dict()['password'] == password:
            return jsonify({'success': 'login successful',
                            'email':userEmail}), 200
        else:
            return jsonify({'error': 'incorrect password or email'}), 400
    return jsonify({'error': 'student does not exist'}), 400




#create student profile
@app.route('/users', methods=['POST'])
def create_profile():
    if not request.data:
        return jsonify({'error': 'No data provided'}), 400
    
    record = json.loads(request.data)

    docs = students_ref.where(u'email', u'==', record['email']).stream()
    for doc in docs:
        return jsonify({'error': 'student already exists'}), 409
    students_ref.document(record['email']).set(record)
    return jsonify(record),200

#get student profile
@app.route('/users', methods=['GET'])
def get_profile():
    email = request.args.get('email')
    doc_ref = students_ref.document(email)
    doc = doc_ref.get()
    if doc.exists:
        
        return jsonify(doc.to_dict())
    else:
        return jsonify({'error': 'student does not exist'}), 400
    
#edit the profile page
@cross_origin()
@app.route('/users/<email>', methods=['PATCH'])
def edit_profile(email):
    
    if not request.data:
        return jsonify({'error': 'No data provided'}), 400
    record = json.loads(request.data)
    doc_ref = students_ref.document(email)
    doc = doc_ref.get()
    print(doc)
    if doc.exists:
        doc_ref.update(record)
        return jsonify(record)
    else:
        return jsonify({'error': 'student does not exist'}), 400


@app.route('/feed', methods=['GET'])
def getFeed():
    
    posts = [post.to_dict() for post in posts_ref.order_by("created_at", direction=firestore.Query.DESCENDING).stream()]

    if len(posts) == 0:
        return jsonify({"Message": "No posts found"}), 404

    return jsonify ({"Posts": posts}), 200

# #Creating a post
# @app.route('/post', methods=['POST'])
# def create_post():

#     if not request.data:
#         return jsonify({"Message": "Request failed"})

#     record = json.loads(request.data)

    
#     current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
#     record["created_at"] = current_time

#     post_ref = db.collection("posts").document(record["email"])
#     posts = post_ref.get()
   

#     db.collection("post").document().set(record)


#     return jsonify({"Message":"Post created successfully"}), 200

def sendEmails():
    emailList = []
    singleEmailList = posts_ref.order_by('created_at',direction = firestore.Query.DESCENDING).limit(1)
    singleEmail = singleEmailList.get()[0].get('email')

    for student in students_ref.stream():
        emailList.append(student.get('email'))
    
    for email in emailList:
        newEmail = mail_ref.document()
        newEmail.set(
            {
             "to":email,
             "message":{
                "subject": "New Post Alert",
                "text": f"A new post has been created on the ashesiconnect by {singleEmail}."
             }
            }
        )

@app.route('/post', methods=['POST'])
def create_post():

    if not request.data:
        return jsonify({"Message": "Request failed"})

    record = json.loads(request.data)

    current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    record["created_at"] = current_time

    # set the document id to the current-time field
    post = db.collection("posts").document(current_time)
    
    
    # create the new document with the email as the document id
    post.set(record)

    sendEmails()

    return jsonify({"Message":"Post created successfully"}), 200






if(__name__ == "__main__"):
    app.run()

