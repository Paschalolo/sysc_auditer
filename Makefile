
MFILE = $(FILE).cpp
MCFILE= $(FILE).c
X_86_FILE=x86_64
GCC = g++-14
GC = gcc-14
GCCFLAGS = -Wall -Wextra -Werror -Wpedantic -Wnull-dereference  -Wshadow -mavx2 -Wconversion -Wduplicated-branches -Wlogical-op -O3  -Wformat=2   -pthread -mavx2 -march=native -fno-exceptions 
CPP23 = -std=c++23
C23 = -std=c23
NORTT= -fno-rtti
INCLUDES = -I includes -I src
SSL = -lssl -lcrypto
COMPILE.cc = $(GCC) $(GCCFLAGS) $(INCLUDES) $(NORTT) $(CPP23)
COMPILE.c = $(GC) $(GCCFLAGS) $(INCLUDES) $(C23)
ASMFILE = $(X_86_FILE).S
OASMFILE = $(X_86_FILE).o
NASM = nasm -felf64 src/$(ASMFILE) -o bin/$(OASMFILE) 
OBJ_DIR = src
OBJS = $(wildcard $(OBJ_DIR)/*.o)
vpath %.c src 
vpath %.cc src 
vpath %.cpp src 
vpath %.h includes 

# Path for the linker for dynamic libaaries 
# e.g ccc src/uselink.c -L lib/ -I lib/ -ltst1 -Wl,-rpath,lib/

runc : $(MFILE) $(HARGS)
	$(COMPILE.cc) $<  -o ./bin/$(FILE) && ./bin/$(FILE)  
run : $(MCFILE)
	$(NASM) 
	$(COMPILE.c) $<   $(HFILE) bin/$(OASMFILE) -o ./bin/ch && ./bin/ch 
run1 : $(MCFILE)
	$(COMPILE.c)  $<   $(HFILE) $(SSL) -o ./bin/ch && ./bin/ch
	rm -rf *.o
clean : 
	rm -rf *.o
object : $(MCFILE) $(HARGS)
	$(COMPILE.c) -c  $< -o ./src/$(FILE).o


create: 
	touch src/$(MCFILE)
createc: 
	touch src/$(MFILE)
push : 
	git add . && git commit -m"message " && git push origin main 
