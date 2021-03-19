# what image we are using
FROM node:15

# set env variables
ENV PORT=3000 APP_DIR=/app

#### how to build 

# create a directory and cd into it
WORKDIR ${APP_DIR}

# copy files from my local machine into the image
ADD fortune-cookie.js .
ADD index.js .
ADD package.json .
ADD package-lock.json .

# run command from image to install the dependencies
RUN npm i

#### how to run

# expose port 3000
EXPOSE ${PORT}

# run the application
ENTRYPOINT [ "node", "index.js" ]

## to build docker application
# docker build -t {username}/{imagename}:{version(can be any)} . <- last dot is context to current directory
# docker build -t yeebinrong/fortunecookie:v2 .

## to run docker application
# docker run -d -p {port to use}:{application's port} --name {unique app name} {name of your image and version}
# docker run -d -p 8080:3000 --name app0 yeebinrong/fortunecookie:v2
# docker run -d PORT=5000 -p 8080:5000 yeebinrong/fortunecookie:v2
# -e PORT=3000 <- sets env variable port to 3000

## docker commands
# docker ps <- check running containers (ps means process)
# docker ps -a <- check logs of containers
# docker stop {name of container} <- stop the docker container
# docker inspect {id of container} <- check process logs
# docker exec -ti {name of container} ls <- list files in your running container (LINUX SYNTAX)