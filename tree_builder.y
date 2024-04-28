%start start
%token BUILDNODE FOR NUMBER VAR STRING IN NAME WEIGHT ISACHILDOF
%token '{' '}' '=' ';' '[' ']' ':' ',' '+'

%{

#include "parse_tree.h"
#include <string>

using namespace std;

int yylex();
void yyerror(const char *);

%}

%union {
    char *str;
    stringExpression *pStr;
    intExpression *pInt;
    statement *pState;
    compoundStatement *pCState;
}

%{
extern int yylex();
extern void yyerror(char *String);  

#include <iostream>
 using namespace std;
   
%}

%type <str> VAR STRING NUMBER
%type <pStr> stringExpression
%type <pInt> intExpression
%type <pState> statement buildNodeStatement
/* %type <pState> statement buildNodeStatement forStatement */
/* %type <pCState> start prog buildNodeStatements */
%type <pCState> start prog 
/* %type <pStrVar> strVariable */


%%

start : prog 
    {
        cout << $1 << endl;
        return 1;
        // map<string, int> mySymTable;
        // $$ = $1;
        // $1 -> evaluateStatement(mySymTable);
    }
    ;

prog: statement prog {cout << "!!!!!";$$ = new compoundStatement($1, $2);}
    | {$$ = NULL;}
    ; 

statement: buildNodeStatement {$$ = $1;}
    /* | forStatement {$$ = $1;} */
    ;

buildNodeStatement: 
    BUILDNODE '{' NAME '=' stringExpression ';' WEIGHT '=' intExpression ';' ISACHILDOF '=' stringExpression ';' '}' ';' 
        {
            cout << "jfldsjak" << endl;
            $$ = new buildNodeStatement($5, $9, $13);
        }
    | BUILDNODE '{' NAME '=' stringExpression ';' WEIGHT '=' intExpression ';' '}' ';'
        {
            $$ = new buildNodeStatement($5, $9, NULL);
        }
    ;

intExpression:
    NUMBER 
        {
            cout << "string: " << $1 << endl;
            $$ = new intConstant(atoi($1));
        }
    | VAR
        {
            $$ = new intVariable($1);
        }
    | intExpression '+' intExpression
        {
            $$ = new plusIntExpression($1, $3);
        }

stringExpression:
    STRING
        {
            cout << "string: " << $1 << endl;
            $$ = new strConstant($1);
        }
    | VAR
        {
            $$ = new strVariable($1);
        }
    | stringExpression '+' stringExpression
        {
            $$ = new plusStrExpression($1, $3);
        }

/* forStatement: FOR VAR IN '[' intExpression ':' intExpression ']' '{' buildNodeStatements '}' '}' {$$ = new intForStatement($2, $5, $7, $10)}; */

/* buildNodeStatements: buildNodeStatement buildNodeStatements {$$ = new buildNodeStatements($1, $2);}
    | {$$ = NULL;} */



%%
#include "lex.yy.c"

void yyerror(const char *msg) {
    printf("Error: %s\n", msg);
}

int main() {
    // Code for testing the parser
    yyparse();
}

