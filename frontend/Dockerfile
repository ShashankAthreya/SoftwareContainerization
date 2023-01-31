FROM node:16-alpine

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install the dependencies
RUN npm ci

# Copy the rest of the code
COPY . .

# Expose the port
EXPOSE 8080

RUN ls -la

# Run the command to start the server
CMD ["npm", "run", "serve"]

## Build an image for building the application
#FROM node:16-alpine as build
#
## Specify the working directory in the container
#WORKDIR /app
#
## Copy the necessary JSON files
#COPY package*.json /app/
#
## Run a clean install
#RUN npm ci
#
## Copy the source code of the application
#COPY . /app
#
## Specify that we want the production build
#ARG configuration=production
#
## Run npm build
#RUN npm run build -- --configuration $configuration
#
#
## Build an image for running the application in
#FROM node:16-alpine
#
#WORKDIR /app
#
## Copy the contents of the built application
#COPY --from=build /app /app
#
#RUN pwd
#RUN ls -la
#
## Expose the port for access
#EXPOSE 8080
#
## # Run the command to start the server
#CMD ["npm", "run", "serve"]
