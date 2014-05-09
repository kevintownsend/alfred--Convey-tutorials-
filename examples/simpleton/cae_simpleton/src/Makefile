EXEC = UserApp.exe
SWMODEL = ../sim/CaeSimPers

all:	$(EXEC) $(SWMODEL)

clean:
	rm -f $(EXEC)
	make --directory=../sim clean

$(EXEC):	UserApp.c cp.s
	cnycc -g UserApp.c cp.s -o UserApp.exe

$(SWMODEL): ../Makefile.include ../sim/CaeIsa.cpp
	make -C ../sim
