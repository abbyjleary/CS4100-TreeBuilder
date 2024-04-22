#include <vector>
#include <string>
#include <iostream>

using namespace std;

struct treeNode {
    string name;
    int weight;
    vector<treeNode*> children;
};

// change these later to call an evaluate expression function that evaluates the expression into nodes with these parameters
// will need a symbol table but i am a little lost on why or how 

class nameStatement{
// holds the name as a string exp
};

class weightStatement{
// holds weight as an int exp
};

class isChildOfStatement{
    // hold is child of as a string exp (?)
};

class variable {
    // holds var name(?? i am a  little lost on this one)
};

class forStatement{
// holds var as a variable
// holds start as an int exp
// holds end as an int exp
};

class statement{
    // one statement either buildnode or for
};

class compoundStatement{
    // multiple statements, one then the rest
};

class buildNodeStatement{
    // (a little lost on this one too but look at the example)
    public:

    private:
        nameStatement* name;
        weightStatement* weight;
        isChildOfStatement* isChildOf;
};

class intExpression{
    // either int or variable or combo
};

class stringExpression{
    // either string or string + variable
};