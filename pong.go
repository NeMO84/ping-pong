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
	port = fmt.Sprintf("localhost:%s", port)

	fmt.Printf("Now serving on %s....", port)
	http.ListenAndServe(port, nil)
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Pong: %v", time.Now())
}
