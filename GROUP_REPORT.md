Group report
Title: Fortune Cookie App Development
Group Members: Laura Rodriguez, Lorena Pinillos, Nerea Ugarte, Bruno Marco, Kim Schäfer, Léa Ulrich
Date: 8. December 2024
 

Roles and contribution:
Lorena initialised a github remote repository with an initial README.md file outlining the project purpose and guidelines, 
as well as installation instructions. She then granted access to all group members. 

Laura created the app.py file on a newly created branch: the app branch. 
The app.py file is a Flask app that connects to a PostgreSQL database and provides routes for managing messages. 
It functions as an online Fortune Cookie app that displays predefined messages such as "Be kind to yourself and others." through 
the initialisation of a database, and also allows users to input messages. There are different routes specified in the app: 
‘/’ route: displays a random message
‘/add’ route: allows users to add new messages
‘/all’ route: shows all the stored messages
‘/health’ route: returns a status
The app uses SQLAlchemy to interact with the database and includes basic functionality to seed the database and manage messages dynamically.

Secondly, Laura created a new templates directory. This contains two html template files that aim at improving the display of 
the Flask application in the browser. The first one is the index.html, which displays a random message from the database, 
as well as allowing the user to add a new message and linking to a page to view all messages. It also includes a simple form for 
submitting new messages and basic styling. The second one is the all_messages.html, which displays a list of all stored messages, 
with each message rendered in a list item. Both files are structured to allow the user to interact with the message system, 
and they are styled minimally for clarity.

After this, Nerea committed our Dockerfile that contains multiple stages in order to build our Docker Image, the Flask application.
The first stage is the development stage, which installs all dependencies, copies the application files, and runs the Flask app
in development mode on port 5000. The second stage is the production stage, which uses a slimmer Python image, copies over
dependencies from the development stage, installs only necessary production dependencies, and runs the Flask app in production mode.
This setup optimizes the Docker image by separating development and production environments.

Nerea then pulled the repository and wrote and committed our requirements file, which specifies the dependencies needed for setting
up the environment and connecting Flask to a PostgreSQL database. This file is used in the third and fourth line of our Dockerfile.

Following this, Laura did a pull request directly from the github in order to merge the app branch into the main branch. 
In the written report a screenshot of this merge can be found. After merging, the app branch was deleted as it had fulfilled its
purpose and its content had been merged.


Meanwhile, Bruno worked on creating the database app in a database branch. He started off by creating a docker-compose.yml file,
where he defined two services: a web and a db. The web service builds the previously described Flask app defined in the Dockerfile.
Its environment variables are FLASK_ENV for development mode and a DATABASE_URL to connect to the database. It depends on the 
db service and is connected to a custom bridge network. The db (database) is a PostgreSQL service, where the database user, 
password, and name are passed through environment variables. It is also connected to the same custom network. The aforementioned 
network that connects both services is called my_custom_network_FC and is explained in the NETWORK_EXPLANATION.txt text file, 
committed by Léa.

Subsequently, Kim committed a .gitignore file. This file’s purpose is to make sure that git literally ignores the files it contains:
in this case the .env file. The .env file was created locally and contains our private information (such as usernames and passwords),
that we do not want to be released on github. Additional information about this and other security details can be found in Kim’s
next commit: the SECURITY_EXPLANATION.txt file. Commit 132a57c also contains an example of the content of the .env file,
to facilitate the creation of a .env file by any future user of our Flask app for their own use. 

As our database was finished, Bruno performed a pull request and merged this branch into the main branch, screenshots of this can
again be found in the written report.

After this, Lorena committed the public deploy key which allows secure and automated access to our repository. This is helpful if
operators or a server needs to fetch code or updates directly from GitHub without requiring manual intervention. This method is 
secure, minimizes access scope, and supports smooth operations.

Because of this public deploy key, Lorena has also had to make changes to the Dockerfile in order to include the cloning of the
repository.

As our project was now almost complete, Laura updated the README.md file in order to include more details, and Kim committed the
TROUBLE_SHOOTING.md file, which contains a table with three columns: possible problems that may arise, their cause and their
solution. This file is used to document common issues future users or developers may encounter while using or setting up the 
project, and provides solutions or workarounds to help resolve problems efficiently without needing external support.

To finish up, Léa committed this group report which contained an overview of every member’s contribution, as well as an explanation
of each step of the process we followed during the creation of our Fortune Cookie app.

In this project, our biggest challenge was understanding how to couple our SSH key to our project to grant future operators access
to our github repository, without risking exposing our personal information. We have learnt that there are various ways to do this
and implemented one of those. 
