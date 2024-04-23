#include <string.h>
#include <iostream>

using namespace std;

extern "C" {
    #include "tree_node.h"
    #include "tree_builder.tab.c"
}

int main(){
    cout << "main" << endl;
    yyparse();
    return 0;
}