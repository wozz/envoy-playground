package main

import (
	"fmt"
	"log"
	"net/http"
	"sort"
	"strings"
)

type handleRequest struct{}

func formatRequest(r *http.Request) string {
	request := []string{fmt.Sprintf("%s %s %s", r.Method, r.URL, r.Proto)}
	request = append(request, fmt.Sprintf("Host: %v", r.Host))
	var requestHeaders []string
	for name, headers := range r.Header {
		for _, h := range headers {
			requestHeaders = append(requestHeaders, fmt.Sprintf("%v: %v", name, h))
		}
	}
	sort.Strings(requestHeaders)
	request = append(request, requestHeaders...)
	return strings.Join(request, "\n")
}

func (*handleRequest) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	log.Printf("[%s]: %s %s", r.RemoteAddr, r.Method, r.URL)
	fmt.Fprintf(w, "incoming request:\n%s\n", formatRequest(r))
}

func main() {
	if err := http.ListenAndServe(":9000", &handleRequest{}); err != nil {
		log.Fatalf("server failed: %v", err)
	}
}
