FROM golang:1.14.0-alpine

RUN apk add --no-cache git

# Set the Current Working Directory inside the container
WORKDIR /src

# Copy source code to container
COPY . /src

# Build the Go app
RUN go build -o ./out/hello-world /src/hello-world.go 


# This container exposes port 8081 to the outside world
EXPOSE 8081

# Run the binary program produced
CMD ["./out/hello-world"]
