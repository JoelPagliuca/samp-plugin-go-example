package main

// #include "../samp-plugin-sdk/plugincommon.h"
// #include "../samp-plugin-sdk/amx/amx.h"
import "C"

import "fmt"

//export Supports
func Supports() uint {
	fmt.Println("Called main.go#Supports")
	return C.SUPPORTS_VERSION | C.SUPPORTS_AMX_NATIVES
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
