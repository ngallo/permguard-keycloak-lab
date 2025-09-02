package main

import (
  "fmt"
  "log"
  "net/http"
)
func main() {
  http.HandleFunc("/api/health", func(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, `{"status":"ok","service":"go-smarthome"}`)
  })
  fmt.Println("go-smarthome running on :4000")
  log.Fatal(http.ListenAndServe(":4000", nil))
}
