MFILE = $(FILE).cpp                
MCFILE= $(FILE).c                                                                        
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

# --- ARCHITECTURE DETECTION ---
ARCH := $(shell uname -m)

ifeq ($(ARCH),x86_64)
    ASM_CMD = nasm -felf64 src/x86_64.S -o bin/x86_64.o
    ASM_OBJ = bin/x86_64.o
else
    # Assumes ARM64 / aarch64
    ASM_CMD = as src/arm64.S -o bin/arm64.o
    ASM_OBJ = bin/arm64.o
endif
# ------------------------------
OBJ_DIR = src 
OBJS = $(wildcard $(OBJ_DIR)/*.o)                                               
vpath %.c src                                                                          
vpath %.cc src                     
vpath %.cpp src                                                                                         
vpath %.h includes                                             
runc : $(MFILE) $(HARGS)
	$(COMPILE.cc) $<  -o ./bin/$(FILE) && ./bin/$(FILE)  

run : $(MCFILE)
	$(ASM_CMD)
	$(COMPILE.c) $< $(HFILE) $(ASM_OBJ) -o ./bin/ch && ./bin/ch
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
