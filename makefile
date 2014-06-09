all : bin
	cp -r ./scripts/* ./bin/.

bin :
	mkdir bin
	
install :
	cp -r ./bin/* ${HOME}/bin/.
