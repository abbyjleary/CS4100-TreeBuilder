#include <vector>
#include <string>
#include <iostream>
#include <map>

using namespace std;

struct treeNode {
    string name;
    int weight;
    vector<treeNode*> children;
};

// change these later to call an evaluate expression function that evaluates the expression into nodes with these parameters
// will need a symbol table but i am a little lost on why or how 

class intExpression{
    public:
        virtual int evaluateStatement(map<string, int> &symTable) =0;
    // either int or variable or combo
};

class stringExpression{
    public:
        virtual string evaluateStatement(map<string, int> &symTable) =0;
    // either string or string + variable
};

class intVariable : public intExpression{
    public:
        intVariable(string v){
            value = v;
        }

        virtual int evaluateStatement(map<string, int> &symTable){
            return symTable[value];
        }
    private:
        string value;
};

class strVariable : public stringExpression{
    public:
        strVariable(string v){
            value = v;
        }

        virtual string evaluateStatement(map<string, int> &symTable){
            return value;
        }
    private:
        string value;
};

class forStatement{
// holds var as a variable
// holds start as an int exp
// holds end as an int exp
};

class statement{
    public:
        virtual void evaluateStatement(map<string, int> &symTable) =0;
    // one statement either buildnode or for
};

class compoundStatement : public statement{
    public:
        compoundStatement(statement* f, compoundStatement* r){
            first = f;
            rest = r;
        };

        virtual void evaluateStatement(map<string, int> &symTable){
            if (first != NULL){
                first->evaluateStatement(symTable);
            }
            if (rest != NULL){
                rest->evaluateStatement(symTable);
            }
        }
    private:
        statement* first;
        compoundStatement* rest;
};

class buildNodeStatement : public statement{
    // (a little lost on this one too but look at the example)
    public:
        buildNodeStatement(stringExpression* n, intExpression* w, stringExpression* i){
            name = n;
            weight = w;
            isChildOf = i;
        };

        virtual void evaluateStatement(map<string, int> &symTable){
            // evaluate the name, weight, and isChildOf statements
            // create a new node with the evaluated values
            // add the node to the tree
        }
    private:
        stringExpression* name;
        intExpression* weight;
        stringExpression* isChildOf;
};

class rangeExpression{
    // either [int:int] or [string, string, ..., string]
};

class plusStrExpression : public stringExpression{
    public:
        plusStrExpression(stringExpression* f, stringExpression* s){
            first = f;
            second = s;
        };

        virtual string evaluateStatement(map<string, int> &symTable){
            // return first->evaluateStatement(symTable) + second->evaluateStatement(symTable);
        }
    private:
        stringExpression* first;
        stringExpression* second;
};

class plusIntExpression: public intExpression{
    public:
        plusIntExpression(intExpression* f, intExpression* s){
            first = f;
            second = s;
        };

        virtual int evaluateStatement(map<string, int> &symTable){
            // return first->evaluateStatement(symTable) + second->evaluateStatement(symTable);
        }
    private:
        intExpression* first;
        intExpression* second;
};

class intConstant : public intExpression {
    public:
        intConstant(int v){
            value = v;
        };

        virtual int evaluateStatement(map<string, int> &symTable){
            return value;
        }

    private:
        int value;
};

class strConstant : public stringExpression {
    public:
        strConstant(string v){
            value = v;
        };

        virtual string evaluateStatement(map<string, int> &symTable){
            return value;
        }

    private:
        string value;
};