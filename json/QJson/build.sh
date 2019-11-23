#build script
#!\clean:
	rm main.o
	rm .qmake.stash
#!\build:
	qmake .
	make
