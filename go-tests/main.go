package main

import "C"

import "fmt"

//export Load
func Load() bool {
	fmt.Println("Called main.go#Load")
	return true
}

func main() {}
