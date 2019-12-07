.PHONY: test clean

GCC := g++ -DLINUX -m32

amxplugin.o:
	$(GCC) -c samp-plugin-sdk/amxplugin.cpp -o $@

hello.so: amxplugin.o
	$(GCC) -shared cpp/hello.cpp $^ -o $@

plugg: hello.so
	cp -f $^ samp/plugins/

.ONESHELL:
test: plugg
	@cd samp
	@rm -f server_log.txt
	@./samp03svr &
	@sleep 1
	@head -n15 server_log.txt
	@kill $$(pgrep samp)

clean:
	rm -rf *.o
	rm -rf *.so
	rm -f samp/server_log.txt server_log.txt
