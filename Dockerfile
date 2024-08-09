# Use the official Node.js image as the base
FROM node:20

# Set the working directory inside the container
WORKDIR /app

# Copy the app source code to the container
COPY . .

# Install dependencies
RUN cd client && npm ci

# Build the Next.js app
RUN cd client && npm run build

# Expose the port the app will run on
EXPOSE 5173

# Start the app
CMD cd client && npm preview
