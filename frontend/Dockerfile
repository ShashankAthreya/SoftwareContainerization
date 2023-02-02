FROM node:16-alpine

# Set the working directory
WORKDIR /app

# Env variable
ARG VUE_APP_API_URL
ENV VUE_APP_API_URL=$VUE_APP_API_URL

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the code
COPY . .

# Expose the port
EXPOSE 8080

# Run the command to start the server
CMD ["npm", "run", "serve"]

