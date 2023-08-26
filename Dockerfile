# using docker image node version 18 alpine base. alpine provides minimal and lightweight image environment
FROM node:18-alpine as base

# set "src" as working directory
WORKDIR /src

# copy package.json and package-lock to workdir container
COPY package*.json ./

# wait till message broker is active
RUN apk add --no-cache bash
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

# set env to production
ENV NODE_ENV=production

# npm ci (stands for clean install) will only install package form packgae-lock.json, and install all exact version from it
RUN npm ci

# copy all js code into the working dir
COPY ./*.js ./

# expose 3000. so container will listen on port 3000
EXPOSE 3000

# specify command that will be executed when container starts
CMD ["npm", "start"]
 
