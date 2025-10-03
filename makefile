
CC = gcc

calculator: calc.tab.c lex.yy.c
	$(CC) $(CFLAGS) -o $@ $^ -lm

calc.tab.c: calc.y
	bison -d $<

lex.yy.c: calc.l
	flex $<



run: calculator
	./calculator input.txt
