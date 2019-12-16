package main

// #include "../samp-plugin-sdk/plugincommon.h"
// #include "../samp-plugin-sdk/amx/amx.h"
import "C"

import (
	"fmt"
	"log"
	"unsafe"
)

//export Supports
func Supports() uint {
	fmt.Println("Called main.go#Supports")
	return C.SUPPORTS_VERSION | C.SUPPORTS_AMX_NATIVES
}

//export Load
func Load(ppData *unsafe.Pointer) bool {
	fmt.Println("Called main.go#Load")
	pAMXFunctions := unsafe.Pointer(uintptr(*ppData) + C.PLUGIN_DATA_AMX_EXPORTS)
	logprintf := (*func(string, ...string))(unsafe.Pointer(uintptr(pAMXFunctions) + C.PLUGIN_DATA_LOGPRINTF))
	log.Printf("logprintf: %v", logprintf)
	(*logprintf)("Hello")
	return true
}

//export Unload
func Unload() {
	fmt.Println("Called main.go#Unload")
}

func main() {}
