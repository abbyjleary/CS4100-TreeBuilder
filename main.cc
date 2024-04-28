#include <iostream>
#include <fstream>
#include "tree_node.h"

using namespace std;

extern "C" {
#include "tree_builder.tab.c"
#include "lex.yy.c"
}


int main(int argc, char* argv[]) {
    if (argc != 2) {
        cerr << "Usage: " << argv[0] << " input_file" << endl;
        return 1;
    }

    // Open the input file
    ifstream inputFile(argv[1]);
    if (!inputFile) {
        cerr << "Error: Unable to open input file." << endl;
        return 1;
    }

    // Set lex/yacc to read from the input file
    yyin = &inputFile;

    // Parse using yyparse and print
    if (yyparse() == 0) {
        cout << "Parsing successful" << endl;

    }
    else {
        cout << "Parsing failed" << endl;
    }

    return 0;
}