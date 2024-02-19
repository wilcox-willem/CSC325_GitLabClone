#!/bin/bash

# WW: GOD BLESS THIS ARTICLE https://medium.com/@codemax120/flutter-web-with-docker-06cee1839adb
# WW: I was getting like 80% of the docker/flutter to work on my local machine
# WW: But after 8+ hours of my only day off, I found that article and it just works
# WW: I have made my own tweaks to the flutter app, but I am afraid to tweak the docker stuff

# Define the port
PORT=9000

# Check if the port is in use and release it if necessary.
echo "Checking if port $PORT is in use..."
if [ "$(lsof -t -i :$PORT)" ]; then
  echo "Port $PORT is in use. Stopping the process on that port..."
  fuser -k -n tcp $PORT
fi

# Switch to the web construction directory
cd /app/build/web/

# Start the web server on the specified port
echo "Starting the server on port $PORT..."
python3 -m http.server $PORT