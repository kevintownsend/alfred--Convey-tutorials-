EXEC = FirstApp.exe
SWMODEL = ../sim/CaeSimPers

all:	$(EXEC) $(SWMODEL)

clean:
	rm -f $(EXEC)
	make --directory=../sim clean

$(EXEC):	FirstApp.cpp cpFirst.s
	cnyCC -g FirstApp.cpp cpFirst.s -o FirstApp.exe

$(SWMODEL): ../Makefile.include ../sim/CaeIsaFirst.cpp
	make -C ../sim
