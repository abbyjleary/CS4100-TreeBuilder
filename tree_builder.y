%start start
%token BUILDNODE FOR NUMBER VAR STRING IN NAME WEIGHT ISACHILDOF LBRACE RBRACE LBRACKET RBRACKET SEMICOLON EQUAL COLON PLUS

%{

#include "parse_tree.h"
#include <stdio.h>

int yylex();
void yyerror(const char *);

struct nodeArgs {
    char* name;
    int weight;
    char* isachildof;
};

%}

%union {
    int intPtr;
    char *stringPtr;
}

// Token definitions
/* %type <statePtr> buildnodeStatement forStatement */
// %type 

%%

start : statements {printf("statements");}
    ;

/* statements : {printf("jklfjdlkajklj");}
    ; */

statements: statement {printf("statements");}
    | statement statements {printf("buildnode root");}
    ; 

/* statement: {printf("statement");} */
 statement: buildnodeStatement {printf("buildnode root");}
    | forStatement {printf("buildnode root");}
    ;

buildnodeStatements: buildnodeStatement {printf("buildnode root");}
    | buildnodeStatement buildnodeStatements {printf("buildnode root");}
    ; 

buildnodeStatement: BUILDNODE LBRACE NAME EQUAL string SEMICOLON WEIGHT EQUAL number SEMICOLON ISACHILDOF EQUAL string SEMICOLON RBRACE SEMICOLON {printf("buildnode child");}
    | BUILDNODE LBRACE NAME EQUAL string SEMICOLON WEIGHT EQUAL number SEMICOLON RBRACE SEMICOLON {printf("buildnode root");}
    ;

forStatement: FOR VAR IN LBRACKET NUMBER COLON NUMBER RBRACKET LBRACE buildnodeStatements RBRACE SEMICOLON {printf("for");};

string: STRING
    | VAR
    | STRING PLUS string
    | VAR PLUS string
    ;

number: NUMBER
    | VAR
    | NUMBER PLUS number
    | VAR PLUS number
    ;

%%

void yyerror(const char *msg) {
    printf("Error: %s\n", msg);
}

int main() {
    // Code for testing the parser
    yyparse();
}

