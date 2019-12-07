# Things I Learnt
* `gcc -l<libname>` links the library with the name `lib<libname>.so`
	* so `/usr/lib/libm.so` is actually the math library given `gcc -lm`
* `**/*.o` is extended globbing, my `bash` doesn't have that enabled by default
* `make`
	* uses `sh` as default shell
	* `-n` for dry-run
	* `-B` forces build
* `ldd` tells you what `so`s a binary is dynamically linked to
* `nm` shows you exported symbols from a binary
* if `hello.so` is statically linked
	* `nm hello.so | grep 'U '` should be blank
	* `ldd hello.so` should say `statically linked`
