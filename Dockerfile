FROM node:20-alpine

# setting the working directory
WORKDIR /app
# dev
# copying package.json into the container
COPY ./package.json .
# installing dependencies
RUN npm install --legacy-peer-deps
# copying local files into the container 
COPY . .
# expose port
EXPOSE 3333/tcp
# running the app
ENTRYPOINT [ "npm"]
CMD ["run", "start"]