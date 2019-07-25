package main

import "net/http"

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, req *http.Request) {
		w.Write([]byte("Heddllo fren"))
		w.WriteHeader(http.StatusOK)
	})
	http.ListenAndServe(":80", nil)
}
