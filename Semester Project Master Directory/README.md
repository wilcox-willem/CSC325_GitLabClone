# flutter_docker_app

A new Flutter project. Check out "readmeWW.txt"


-----------------------------------------------------------------------------------
# How to run this flutter app w/ docker
## You will need:
 - Docker
 - VS Code (*with extensions below)
	 - remote dev
	 - docker
	 - flutter
- Git (you are here in my repo!)
 - time and patience
## Getting Started
First, ensure all "needs" are installed and up to date (& correct pathing)
(if cloning from master git, skip to "run container" section)

Open VS Code and use the command pallete (ctrl+shift+p) to search for
 - "Flutter: New Project"
 - select "Application"
 - name your flutter project (Ex: flutter_docker_app)

Within the flutter project folder, create a "Dockerfile"
 - For a premade Dockerfile, reference the article below
	 - https://medium.com/@codemax120/flutter-web-with-docker-06cee1839adb
 - this guide is centered around this article, saving grace ^^^
 - OTHERWISE
 - make/edit the Dockerfile at your own risk, here are the docs
	 - https://docs.docker.com/engine/reference/builder/ 
 
Also within the flutter project folder, create a "server" folder/directory
Within the "server" folder/directory, create a "server.sh" script
 - This script is designed to prep a port for the web app
 - It can also be found at the following article
 - https://medium.com/@codemax120/flutter-web-with-docker-06cee1839adb
 - this script is tailored to the premade Dockerfile ^^^

Now, it is time to build the image we will be using for our container
In terminal while in the flutter project folder, use the following command
 - docker build . -t flutter_docker_img

This will take a while, and can sometimes crash if slow internet

## Run Container
Once the image is built, it is time to run it! use the following command
 - docker run -i -p 8080:9000 -td flutter_docker
Now, if everything has gone correctly, open a browser and go to
 - http://localhost:8080/
You should see a flutter app!
---
