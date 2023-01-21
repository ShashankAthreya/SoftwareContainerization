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

# Run the command to start the server
CMD ["npm", "run", "serve"]
