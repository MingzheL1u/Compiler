scanner: GrammarTree.l GrammarTree.y GrammarTree.h
	bison -d -v GrammarTree.y
	flex GrammarTree.l
	gcc GrammarTree.c GrammarTree.tab.c -lfl -ly -o scanner

.PHONY: clean
clean:
	rm scanner GrammarTree.tab.c GrammarTree.tab.h lex.yy.c
