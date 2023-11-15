FROM circleci/golang:1.16-stretch-node-browsers-legacy

# Switch to root to create the user
USER root

# Create a non-root user
RUN useradd -ms /bin/bash myuser

# Set the working directory to the home directory of the new user
WORKDIR /home/myuser

# Set ownership of the output directory
RUN chown -R myuser:myuser /home/myuser

# Specify the user to run the application
USER myuser

# Copy the local package files to the container's workspace
COPY . .

# Build the Golang application as the non-root user
RUN go build -o main .

# Command to run the executable
CMD ["./main"]
