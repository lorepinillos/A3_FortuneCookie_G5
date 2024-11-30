README.md
Fortune Cookie App
This app is a flask-based web application that gives randomized motivational messages to users. The app is containerized with Docker and includes a PostgreSQL database for storing messages.
 
Features:
-          	Random Messages: Displays randomly selected motivational messages from a database.
-          	Database Integration: Utilizes PostgreSQL for message storage and retrieval.
-          	Containerized Deployment: Includes Docker and Docker Compose for easy setup and deployment
- Adding Messages: Allows users to update the Database with customised messages
 
Pre-requisites
-          	Python 3.9 or higher installed on your system.
-          	Docker and Docker Compose
 
1. 	Clone the repository:
git clone: git@github.com:lorepinillos/A3_FortuneCookie_G5.git
cd A3_FortuenCookie_G5
2.    	Set up the environment variables:
-          	Create a .env file in the root directory with the following content format:

DATABASE_USER = xxx
DATABASE_PASSWORD=xxx
DATABASE_NAME=xxx
 
3. 	Build and start the containers:
docker-compose up --build -d
 
4. 	Test the app
-          	Access the app in your browser at http://localhost:5326
-          	Use curl to test endpoints: 
curl http://localhost:5326

 
Security Practices
-          	Sensitive information is stored in a .env file and excluded from version control using .gitignore.
 
Troubleshooting
-          	Check the TROUBLESHOOTING.md for solutions
