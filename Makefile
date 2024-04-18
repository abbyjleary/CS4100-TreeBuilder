default: scanner

scanner: lex.yy.c
	g++ lex.yy.c -o scanner

lex.yy.c: tree_builder.l
	lex tree_builder.l