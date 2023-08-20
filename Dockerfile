FROM node:14

# Create app directory
WORKDIR /app

# copy all file into working directory
COPY . .

#environment variable
ENV NODE_ENV=production
ENV DB_HOST=item-db

#install prod dependencies 
RUN npm install --production --unsafe-perm && npm run build

#expose port 8080 on container
EXPOSE 8080

#runs the command to start the application
CMD [ "npm", "start" ]
