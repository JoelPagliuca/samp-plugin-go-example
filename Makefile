samp-plugin-sdk.so:
	g++ -DLINUX -m32 -c samp-plugin-sdk/amxplugin.cpp

hello.so:
	g++ -DLINUX -m32 -shared -c cpp/hello.cpp -o hello.so

clean:
	rm -rf **/*.o