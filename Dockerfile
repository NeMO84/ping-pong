# Go - Simple Ping/Pong Server
FROM arm32v7/busybox
LABEL Author="Nirmit Patel"

WORKDIR /app
COPY ./build/pong /app/

EXPOSE 8083
CMD ["/app/pong"]
