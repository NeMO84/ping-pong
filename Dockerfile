# Go - Simple Ping/Pong Server
# Build env for Go
FROM golang:alpine3.9 AS build-env
WORKDIR /app
COPY ./pong.go /app/
RUN cd /app && env GOOS=linux GOARCH=arm GOARM=7 go build pong.go

# Run env for application
FROM arm32v7/busybox
LABEL Author="Nirmit Patel"
WORKDIR /app
COPY --from=build-env /app/pong /app

EXPOSE 8083
CMD ["./pong"]
