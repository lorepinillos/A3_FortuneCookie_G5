from flask import Flask, jsonify, render_template, request, redirect
from flask_sqlalchemy import SQLAlchemy
import random

app = Flask(__name__)

# Database configuration
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://user:12345@db:5432/messages_db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# Database model
class Message(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    text = db.Column(db.String(200), nullable=False)

# Flag to ensure seeding only happens once
db_initialized = False

@app.before_request
def initialize_db_once():
    global db_initialized
    if not db_initialized:
        db.create_all()
        if not Message.query.first():
            messages = [
                "Today is your lucky day!",
                "Hard work pays off!",
                "Be kind to yourself and others.",
                "Success is around the corner.",
                "You are capable of amazing things!"
            ]
            for msg in messages:
                db.session.add(Message(text=msg))
            db.session.commit()
        db_initialized = True

# Route to get a random message
@app.route("/")
def get_random_message():
    messages = Message.query.all()
    if messages:
        random_message = random.choice(messages)
        return render_template("index.html", message=random_message.text)
    else:
        return render_template("index.html", message="No messages available.")

# Route to add a new message
@app.route("/add", methods=["POST"])
def add_message():
    new_message = request.form.get("message")
    if new_message:
        db.session.add(Message(text=new_message))
        db.session.commit()
    return redirect("/")

# Route to display all messages
@app.route("/all")
def view_all_messages():
    messages = Message.query.all()
    return render_template("all_messages.html", messages=messages)

# Health check endpoint
@app.route("/health")
def health_check():
    return jsonify({"status": "OK"}), 200

if __name__ == "__main__":
    app.run(debug=False, host="0.0.0.0")


