# DevContainer Environment

### Introduction: 

>Developement containers (DevContainers, DC's) are similiar to virtual machines, in the fact that they are are a self-contained reproducable build environment. DevContainers make it easier to quickly replicate environment configurations without the fear of "well it works on my machine" issues. Furthermore, they are more light-weight than virtual machines, making them even easier to spin up and get to coding.
>
>In the context of flutter development, dev containers make it easier to write on the same chosen platform (PC, Mobile, Web) and configure any required packages (like the flutter sdk, git). Furthermore, dev containers can be adjusted to automatically clone and execute repositories. This ensures the right tools are present and configured each time, ready to go. This saves time and drastically reduces the chances of misconfiguration between setups and user dev environments (like my laptop VS my desktop VS a university computer VS a work computer)
>
>This will cover my journey of configuring, using, and modifying my Flutter Web DevContainer environment using Docker in VS Code.


### Configurations:
***
### Docker
* Install and tailor to your devices needs with https://docs.docker.com/engine/install/
* In my case, I installed for Windows with https://docs.docker.com/desktop/install/windows-install/
* I did not configure or change much, my install of Docker was vanilla/reccomended 

#### VS Code
* **Extensions:**
    - Docker
    - Remote Developement
    - Dart Developement
    - Flutter Developement
* **Using VS Code to Make DevContainer**
    - Using the command pallete (ctrl+shift+p on Windows) use the following
        > Dev Containers: Add Dev Container Configuration File...
    - This will start the GUI/guided process for setting up a dev container. This is how I started and laid the foundation for my DockerFile and configurations. 
#### DockerFile

This section includes code snippets of my DockerFile, including line numbers (EX: ``22| RUN "HelloWorld"``)

* **Base Image:** 
    - Ubuntu v20.04
    - ``8| FROM ubuntu:20.04`` 

* **DockerFile Configurations:**
    - using **RUN** and **ENV** commands, are used to configure the base image and packages for Flutter and Git. Between lines of code, I will explain why and what it is doing.

    - Set OS to not require *y/n* CLI dialogue for installs

        ``10| ENV DEBIAN_FRONTEND=noninteractive``

    - Start installing packages and updates

        ``12| RUN apt-get update``
        
        ``13| RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback python3``
        
        ``14| RUN apt-get clean``

    - Set OS dialogue back again

        ``16| ENV DEBIAN_FRONTEND=dialog``

    - Start prepping Flutter
        
        ``17| ENV PUB_HOSTED_URL=https://pub.flutter-io.cn``
        
        ``18| ENV FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn``
        
    - Download Flutter SDK from Flutter Github repo
        
        ``21| RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter``

    - Adjust path to include Flutter

        ``24| ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"``

    - Use flutter doctor, to make ensure install is ready
        
        ``27| RUN flutter doctor``

    - Enable flutter web
        
        ``30| RUN flutter channel master``

        ``31| RUN flutter upgrade``

        ``32| RUN flutter config --enable-web``

    - Copy repo from git to container and build it
        
        ``35| RUN mkdir /app/``
        
        ``36| COPY . /app/``
        
        ``37| WORKDIR /app/``
        
        ``38| RUN flutter build web``

    - Expose a port for the web server
       
        ``41| EXPOSE 9000``

    -  Make the "server startup script" executable and start the web server
        
        ``44| RUN ["chmod", "+x", "/app/server/server.sh"]``

        ``46| ENTRYPOINT [ "/app/server/server.sh"]``
##

### Usage:

>Using this DevContainer allows me to quickly and consistently spin up my project. 
>
>This makes it easy to get it up and running, regardless of what machine I am working on, and I can make changes in real time and push them to Git before closing the DevContainer, saving them for the next time I am developing my Flutter App/s.
>
>Finally, I also take advantage of Git's online editor to make tweaks and modifications from any machine, so even when I don't have access to my desktop/laptop, I can work on my project. It is more difficult, since I can't run it in real time in the container, but it's hard to complain when I can make small tweaks on my phone when I have 10-15 min of downtime.

##

### Challenges and Solutions: 

>The most frustrating part about developing my Dev environment was getting started. Going from 0% to 10% is infinitely harder to me than 90% to 100%. Using VS Code as a crutch was vital in the beginning, but the more I used Docker and the DockerFile, the more it made sense. I have a better understanding of how to start, use, and edit dev containers. Another tricky part was trying to use Flutter and Docker (both things I haven't used before, fortunately I used Git already). 
>
>In future, I think the most helpful thing would be spending more time writing the DockerFile and seeing what different DockerFile's are used for industry practices. I am curious what some companies/groups/dev teams/etc swear by as the best Docker configurations.

##
### Conclusion: 

>Using VS Code, Docker, Flutter SDK, and Git to build my DevContainer/DevEnvironment reinforced/taught the following lessons
>   - **Standardization** is useful and makes life easier
>   - **Configuration** is key to understanding how something works, as well as making it work how you want
>   - **Documentation** makes it easier to remember and understand how things work, as well as why its supposed to work the way it does
>   - **Exploration** is similar to configuration, but more along the lines of trial-and-error. Like deleting a line of code or adding one, then seeing what happens. Along with looking at online resources and examples to see what else can be done
>   - **Determination** is important, because things will fail, crash, and burn in front of you... but... eventually after enough failures things will fail less and less. Giving up is the truest form of failure, the rest are more so learning opportunities
>
>Overall, I got a lot of helpful experience in a multitude of areas. My ability to submerge myself in a difficult and/or strange task has strengthened, and I feel more confident exploring and tweaking my project (as well as containers as a whole).
