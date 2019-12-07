# always rebuild these targets
.PHONY: test clean

# g++ with all my fancy options
GCC := g++ -DLINUX -m32

default: test

samp03/server.cfg:
	@echo "downloading samp server for linux"
	@curl -L --silent 'http://files.sa-mp.com/samp037svr_R2-1.tar.gz' --output samp.tar.gz
	@tar xzf samp.tar.gz
	@mkdir samp03/plugins
	@echo "modifying config"
	@sed -i 's/changeme/fuckyou/g' samp03/server.cfg
	@echo "plugins hello.so" >> samp03/server.cfg

install: samp03/server.cfg
	git submodule update --init --recursive

amxplugin.o: install
	$(GCC) -c samp-plugin-sdk/amxplugin.cpp -o $@ 2>/dev/null

hello.so: amxplugin.o
	$(GCC) -shared cpp/hello.cpp $^ -o $@ 2>/dev/null

plugg: hello.so
	cp -f $^ samp03/plugins/

.ONESHELL:
test: plugg
	@cd samp03
	@rm -f server_log.txt
	@./samp03svr &
	@sleep 1
	@head -n15 server_log.txt
	@kill $$(pgrep samp)

clean:
	rm -rf *.o
	rm -rf *.so
	rm -f samp03/server_log.txt
