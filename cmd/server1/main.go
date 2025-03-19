package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "server 1 reponse")
	})

	log.Fatal(http.ListenAndServe(":1111", nil))
}
