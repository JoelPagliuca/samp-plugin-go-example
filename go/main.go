package main

import "C"

import "fmt"

//export Supports
func Supports() uint32 {
	fmt.Println("Called main.go#Supports")
	return 0
}

//export Load
func Load() bool {
	fmt.Println("Called main.go#Load")
	return true
}

//export Unload
func Unload() {
	fmt.Println("Called main.go#Unload")
}

func main() {}
