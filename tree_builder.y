%start start
%token BUILDNODE FOR NUMBER VAR STRING IN NAME WEIGHT ISACHILDOF
%token '{' '}' '=' ';' '[' ']' ':' ',' '+'

%{

#include "parse_tree.h"
#include <string>

using namespace std;

// global var that points to root
treeNode* tree = NULL;

int yylex();
void yyerror(const char *);

%}

%union {
    char *str;
    stringExpression *pStr;
    intExpression *pInt;
    statement *pState;
    struct treeNode* pNode;

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
%type <pState> statement buildNodeStatement forStatement
/* %type <pState> statement buildNodeStatement forStatement */
%type <pCState> start prog buildNodeStatements
/* %type <pStrVar> strVariable */

%%

start : commands 
    {
        printTree(tree);
    }
    ;

commands: 
    statement commands
    | 
    ; 

statement: 
    buildNodeStatement 
    | forStatement
    ;

buildNodeStatement: 
    BUILDNODE '{' NAME '=' stringExpression ';' WEIGHT '=' intExpression ';' ISACHILDOF '=' stringExpression ';' '}' ';' 
        {
            addNode($5, $9, $13, tree)
        }
    | BUILDNODE '{' NAME '=' stringExpression ';' WEIGHT '=' intExpression ';' '}' ';' // is a root
        {
            addNode($5, $9, NULL, tree)
        }
    ;

intExpression:
    NUMBER 
        {
            $$ = atoi($1);
        }
    | VAR
        {
            $$ = new intVariable($1);
        }
    | intExpression '+' intExpression
        {
            $$ = addition($1, $3);
        }

stringExpression:
    STRING
        {
            $$ = $1;
        }
    | VAR
        {
            $$ = $1;
        }
    | stringExpression '+' stringExpression
        {
            $$ = concat($1, $3);
        }
    | stringExpression '+' intExpression
    {
        char intString[5];
        sprintf(intString, "%d", $3);
        $$ = concat($1, intString);
    }
    | intExpression '+' stringExpression
    {
        char intString[5];
        sprintf(intString, "%d", $1);
        $$ = concat(intString, $3);
    }

forStatement: 
    FOR VAR IN '[' intExpression ':' intExpression ']' '{' buildNodeStatements '}' 
        {
            //$$ = new intForStatement($2, $5, $7, $10)
        };
    | FOR VAR IN '[' stringExpression ']' '{' buildNodeStatements '}' 
        {
            //$$ = new stringForStatement($2, $5, $7, $10)
        };

buildNodeStatements: buildNodeStatement buildNodeStatements {$$ = new buildNodeStatements($1, $2);}
    | 



%%


void yyerror(const char *msg) {
    printf("Error: %s\n", msg);
}


