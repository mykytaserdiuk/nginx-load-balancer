package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "server 2 reponse")
	})

	http.ListenAndServe(":2222", nil)
}
