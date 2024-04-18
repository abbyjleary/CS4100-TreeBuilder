%{
/*
* CS 4100
* TreeBuilder
* 4/17/2024
* Abby Leary and Adeline Fitzwater
*/

#define BUILDNODE
#define FOR
#define NUMBER
#define VAR
#define STRING

%}

D [0-9]
LD [a-zA-Z0-9]
LDU [a-zA-Z0-9_]

%%

buildnode {return BUILDNODE;}

for {return FOR;}

\-?{D}* {return NUMBER;}

{LD}{LDU}* {return VAR;}

\".*\" {}

%%