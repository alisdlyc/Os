TARGET     = lib30day

OBJS       = abs.o atof.o atoi.o errno.o frexp.o ldexp.o \
	memchr.o memcmp.o memmove.o memset.o qsort.o rand.no \
	sprintf.o strcat.o strcmp.o strcpy.o strcspn.o strdup.o \
	strlen.o strncat.o strncmp.o strncpy.o strpbrk.o strrchr.o \
	strspn.o strstr.o strtol.o strtoul.o strtoul0.o vsprintf.o

MAKE     = $(TOOLPATH)make -r

ALL :
	$(MAKE) $(TARGET).a
	
%.o : %.c Makefile
	 gcc  -fno-builtin -fno-PIC -Wall -ggdb -m32 -gstabs -nostdinc  -fno-stack-protector -nostdinc -I./ -c $*.c -o $*.o
	 
%.no : %.nas Makefile
	nasm -g $*.nas -f elf32 -l $*.lst -o $*.no
	
$(TARGET).a : $(OBJS) Makefile
	   #cp $*.no $*.o
       #ar crv lib30day.a *.o
	   echo

