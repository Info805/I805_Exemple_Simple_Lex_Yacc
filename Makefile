.PHONY: all clean 
GENERATED_LEX=lex.yy.c
GENERATED_BISON=simple.tab.c simple.tab.h
GENERATED=${GENERATED_BISON} ${GENERATED_LEX} simple *.o
LDFLAGS=

all : simple

${GENERATED_LEX}: simple.l
	lex simple.l

${GENERATED_BISON}: simple.y
	bison -d simple.y

lex.yy.o: lex.yy.c simple.tab.h
	cc -c -o lex.yy.o lex.yy.c

simple: simple.tab.o lex.yy.o
	cc -o simple $(LDFLAGS) simple.tab.o lex.yy.o 

clean: 
	rm -f ${GENERATED} 