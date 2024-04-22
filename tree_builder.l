%{
/*
* CS 4100
* TreeBuilder
* 4/17/2024
* Abby Leary and Adeline Fitzwater
*/

#define BUILDNODE 1
#define FOR 2
#define NUMBER 3
#define VAR 4
#define STRING 5
#define IN 7
#define NAME 8
#define WEIGHT 9
#define ISACHILDOF 10
#define LBRACKET 11
#define RBRACKET 12
#define LBRACE 13
#define RBRACE 14
#define SEMICOLON 15
#define EQUAL 16
#define COLON 17
#define PLUS 18

%}

D [0-9]
LD [a-zA-Z0-9]
LDU [a-zA-Z0-9_]

%%

buildnode {return BUILDNODE;}

for {return FOR;}

in {return IN;}

name {return NAME;}

weight {return WEIGHT;}

isachildof {return ISACHILDOF;}

"[" {return LBRACKET;}

"]" {return RBRACKET;}

"{" {return LBRACE;}

"}" {return RBRACE;}

";" {return SEMICOLON;}

"=" {return EQUAL;}

":" {return COLON;}

"+" {return PLUS;}

{D}* {return NUMBER;}

{LD}{LDU}* {return VAR;}

\".*\" {return STRING;}

[ \t\n\f\r] { }

. { }

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
//                 printf("VAR\n");
//                 break;
//             case STRING:
//                 printf("STRING\n");
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