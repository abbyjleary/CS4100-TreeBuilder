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

{D}* {return NUMBER;}

{LD}{LDU}* {return VAR;}

\".*\" {return STRING;}

[ \t\n\f\r] { }

. {return yytext[0];}

%%

int yywrap() {
    return 1;
}
