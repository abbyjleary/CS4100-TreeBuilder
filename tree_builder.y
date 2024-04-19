%start start
%token BUILDNODE, FOR, NUMBER, VAR, STRING, OTHER, IN, NAME, WEIGHT, ISACHILDOF

%{

#include <iostream>
#include <vector>
#include "parse_tree.h"
using namespace std;

int yylex();
void yyerror(const char *);

%}

%union {
    int intValue;
    char *stringValue;
}

// Token definitions
%type <intValue> NUMBER
%type <stringValue> STRING

%%

start : ;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
}

int main() {
    // Code for testing the parser
    yyparse();
    return 0;
}

