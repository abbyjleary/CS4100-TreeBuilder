%{
/*
* CS 4100
* TreeBuilder
* 4/17/2024
* Abby Leary and Adeline Fitzwater
*/

#include <string.h>
#include <ctype.h>
#include "tree_builder.tab.c"


%}

D [0-9]
LD [a-zA-Z0-9]
LDU [a-zA-Z0-9_]

%%

buildnode {yylval.str = strdup(yytext); return BUILDNODE;}

for {yylval.str = strdup(yytext); return FOR;}

in {yylval.str = strdup(yytext); return IN;}

name {yylval.str = strdup(yytext); return NAME;}

weight {yylval.str = strdup(yytext); return WEIGHT;}

isachildof {yylval.str = strdup(yytext); return ISACHILDOF;}

{D}* {yylval.str = strdup(yytext); return NUMBER;}

{LD}{LDU}* {yylval.str = strdup(yytext); return VAR;}

\".*\" {yylval.str = strdup(yytext); return STRING;}

[ \t\n\f\r] { }

. { return yytext[0]; }

%%

int yywrap() {
    return 1;
}

// int main() {
//     int token;
//     while ((token = yylex())) {
//         switch (token) {
//             case BUILDNODE:
//                 printf("BUILDNODE\n");
//                 break;
//             case FOR:
//                 printf("FOR\n");
//                 break;
//             case NUMBER:
//                 printf("NUMBER\n");
//                 break;
//             case VAR:
//                 printf("VAR: %s\n", yytext);
//                 break;
//             case STRING:
//                 printf("STRING: %s\n", yytext);
//                 break;
//             case IN:
//                 printf("IN\n");
//                 break;
//             case NAME:
//                 printf("NAME\n");
//                 break;
//             case WEIGHT:
//                 printf("WEIGHT\n");
//                 break;
//             case ISACHILDOF:
//                 printf("ISACHILDOF\n");
//                 break;
//             case LBRACKET:
//                 printf("LBRACKET\n");
//                 break;
//             case RBRACKET:
//                 printf("RBRACKET\n");
//                 break;
//             case LBRACE:
//                 printf("LBRACE\n");
//                 break;
//             case RBRACE:
//                 printf("RBRACE\n");
//                 break;
//             case SEMICOLON:
//                 printf("SEMICOLON\n");
//                 break;
//             case EQUAL:
//                 printf("EQUAL\n");
//                 break;
//             case COLON:
//                 printf("COLON\n");
//                 break;
//             case PLUS:
//                 printf("PLUS\n");
//                 break;
//             default:
//                 printf("Unrecognized token\n");
//                 break;
//         }
//     }
//     return 0;
// }