target: test

golib.so: main.go
	go build -o $@ -buildmode=c-shared $<

driver: driver.c golib.so
	gcc -L. -o $@ driver.c -l:golib.so

test: driver
	@export LD_LIBRARY_PATH=$(shell pwd):$(LD_LIBRARY_PATH)
	@./$<

clean:
	rm -f driver
	rm -f *.so
	rm -f *.h
