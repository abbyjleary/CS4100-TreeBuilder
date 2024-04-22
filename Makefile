default: treeBuilder

treeBuilder: lex.yy.o tree_builder.tab.o
	g++ -o treeBuilder lex.yy.o tree_builder.tab.o

lex.yy.o tree_builder.tab.o: lex.yy.c tree_builder.tab.c tree_node.h parse_tree.h

lex.yy.c: tree_builder.l
	lex -o lex.yy.c tree_builder.l

tree_builder.tab.c: tree_builder.y
	yacc -o tree_builder.tab.c -t -v tree_builder.y

clean:
	rm -f treeBuilder lex.yy.o tree_builder.tab.o lex.yy.c tree_builder.tab.c tree_builder.tab.h
