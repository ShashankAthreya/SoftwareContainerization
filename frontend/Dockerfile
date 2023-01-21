# Build an image for building the application
FROM node:16-alpine as build

# Specify the working directory in the container
WORKDIR /app

# Copy the necessary JSON files
COPY package*.json /app/

# Run a clean install
RUN npm ci

# Copy the source code of the application
COPY . /app

# Specify that we want the production build
ARG configuration=production

# Run npm build
RUN npm run build -- --configuration $configuration


# Build an image for running the application in
FROM node:16-alpine

WORKDIR /app

# Copy the contents of the built application
COPY --from=build /app/dist/ /app

# Expose the port for access
EXPOSE 8080

# # Run the command to start the server
CMD ["npm", "run", "serve"]
