

all: wrapper.so

wrapper.cpp: wrapper.pyx
	cython --cplus wrapper.pyx

wrapper.so: wrapper.cpp test.cpp
	g++ -shared -fPIC -o wrapper.so test.cpp wrapper.cpp -I/usr/include/python2.7

clean:
	rm -rf wrapper.cpp wrapper.so