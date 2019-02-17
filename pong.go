package main

import (
	"fmt"
	"net/http"
	"os"
	"time"
)

const (
	// PORT configures the default port to use if an enviornment
	// one wasn't supplie
	PORT string = "8083"
)

func main() {
	http.HandleFunc("/", handler)

	var port string
	if p := os.Getenv("PONG_PORT"); p != "" {
		port = p
	} else {
		port = PORT
	}
	port = fmt.Sprintf("0.0.0.0:%s", port)

	fmt.Printf("Now serving on %s....", port)
	err := http.ListenAndServe(port, nil)
	if err != nil {
		fmt.Printf("Failed to start server: %s", err)
	}
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Pong: %v", time.Now())
}
