%start start
%token BUILDNODE FOR NUMBER VAR STRING IN NAME WEIGHT ISACHILDOF

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

statements: statement {printf("buildnode root");}
    | statement statements {printf("buildnode root");}
    ; 

statement: buildnodeStatement {printf("buildnode root");}
    | forStatement {printf("buildnode root");}
    ;

buildnodeStatements: buildnodeStatement {printf("buildnode root");}
    | buildnodeStatement buildnodeStatements {printf("buildnode root");}
    ;

buildnodeStatement: BUILDNODE '{' NAME '=' STRING ';' WEIGHT '=' NUMBER ';' ISACHILDOF '=' STRING ';' '}' ';' {printf("buildnode child");}
    | BUILDNODE '{' NAME '=' STRING ';' WEIGHT '=' NUMBER ';' '}' ';' {printf("buildnode root");}
    ;

forStatement: FOR VAR IN '[' NUMBER ':' NUMBER ']' '{' buildnodeStatements '}' ';' {printf("for");};

%%

void yyerror(const char *msg) {
    printf("Error: %s\n", msg);
}

int main() {
    // Code for testing the parser
    yyparse();
}

