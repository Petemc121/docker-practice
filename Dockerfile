#each of these lines are considered as layers, which are cached in the docker image for better performance

FROM node:12

#sets the working directory (where you can run commands etc)
WORKDIR /app

#source destination
COPY package.json ./  

#command 
#RUN is like opening a terminal session and running a command
RUN npm install

#copies all local files to the current working directory
#this would also copy node modules, which would overide the node modules we want to install in the container. We therefore need a docker ignore file. 
COPY . .

#gives the port environment 
ENV PORT=8080

EXPOSE 8080

#tells the container how to run the application 
#does by starting a process to serve the express app. 
CMD ["npm", "start"]



