#include <vector>
#include <string>
#include <iostream>
#include <map>
#include "tree_node.h"

using namespace std;

// done?
class intExpression
{
public:
    // should replace them with these because we actually dont need the symtable
    // virtual int evaluateStatement(pair<string, int> &vars, vector<treeNode> &nodes) = 0;
    virtual int evaluateStatement(map<string, int> &symTable) = 0;
};

// done?
class stringExpression
{
public:
    virtual string evaluateStatement(map<string, int> &symTable) = 0;
};

// todo
class intVariable : public intExpression
{
public:
    intVariable(string v)
    {
        value = v;
    }

    virtual int evaluateStatement(map<string, int> &symTable)
    {
        return symTable[value];
    }

private:
    string value;
};

// todo
class strVariable : public stringExpression
{
public:
    strVariable(string v)
    {
        value = v;
    }

    virtual string evaluateStatement(map<string, int> &symTable)
    {
        return value;
    }

private:
    string value;
};

// todo
class rangeExpression
{
public:
    rangeExpression(){};

    virtual void evaluateStatement(map<string, int> &symTable)
    {
        // evaluate the start and end expressions
        // return a range from start to end
    }

private:
    vector<stringExpression> *strings;
};

// done
class statement
{
public:
    virtual void evaluateStatement(map<string, int> &symTable) = 0;
    // one statement either buildnode or for
};

// done
class compoundStatement
{
public:
    compoundStatement(statement *f, compoundStatement *r)
    {
        first = f;
        rest = r;
    };

    virtual void evaluateStatement(map<string, int> &symTable)
    {
        if (first != NULL)
        {
            first->evaluateStatement(symTable);
        }
        if (rest != NULL)
        {
            rest->evaluateStatement(symTable);
        }
    }

private:
    statement *first;
    compoundStatement *rest;
};

// todo
class buildNodeStatement : public statement
{
    // (a little lost on this one too but look at the example)
public:
    buildNodeStatement(stringExpression *n, intExpression *w, stringExpression *i)
    {
        name = n;
        weight = w;
        isChildOf = i;
    };

    virtual void evaluateStatement(map<string, int> &symTable)
    {
        // evaluate the name, weight, and isChildOf statements
        // create a new node with the evaluated values
        // add the node to the tree
    }

private:
    stringExpression *name;
    intExpression *weight;
    stringExpression *isChildOf;
};

// todo
class buildNodeStatements : public compoundStatement
{
    // (a little lost on this one too but look at the example)
public:
    buildNodeStatements(buildNodeStatement *f, buildNodeStatements *r)
    {
        first = f;
        rest = r;
    };

    virtual void evaluateStatement(map<string, int> &symTable)
    {
        if (first != NULL)
        {
            first->evaluateStatement(symTable);
        }
        if (rest != NULL)
        {
            rest->evaluateStatement(symTable);
        }
    }

private:
    buildNodeStatement *first;
    buildNodeStatements *rest;
};

// todo
class strForStatement
{
    // holds var as a variable
    // holds start as an int exp
    // holds end as an int exp
public:
    strForStatement(strVariable *v, rangeExpression *r)
    {
        var = v;
        range = r;
    };

    void evaluateStatement(map<string, int> &symTable)
    {
        // evaluate the range
        // for each value in the range, evaluate the var and add it to the symbol table
    }

private:
    strVariable *var;
    rangeExpression *range;
};
// todo
class intForStatement
{
    // holds var as a variable
    // holds start as an int exp
    // holds end as an int exp
public:
    intForStatement(char *v, intExpression *s, intExpression *e, buildNodeStatements *b)
    {
        var = v;
        start = s;
        end = e;
        buildNodes = b;
    };

    void evaluateStatement(map<string, int> &symTable)
    {
        // evaluate the start and end expressions
        // for each value in the range, evaluate the var and add it to the symbol table
    }
private:
    char* var;
    intExpression *start;
    intExpression *end;
    buildNodeStatements *buildNodes;
};

// todo
class manyStrings
{
    // public:

    // private:
};

// done
class plusStrExpression : public stringExpression
{
public:
    plusStrExpression(stringExpression *f, stringExpression *s)
    {
        first = f;
        second = s;
    };

    virtual string evaluateStatement(map<string, int> &symTable)
    {
        return first->evaluateStatement(symTable) + second->evaluateStatement(symTable);
    }

private:
    stringExpression *first;
    stringExpression *second;
};

// done
class plusIntExpression : public intExpression
{
public:
    plusIntExpression(intExpression *f, intExpression *s)
    {
        first = f;
        second = s;
    };

    virtual int evaluateStatement(map<string, int> &symTable)
    {
        return first->evaluateStatement(symTable) + second->evaluateStatement(symTable);
    }

private:
    intExpression *first;
    intExpression *second;
};

// done
class intConstant : public intExpression
{
public:
    intConstant(int v)
    {
        value = v;
    };

    virtual int evaluateStatement(map<string, int> &symTable)
    {
        return value;
    }

private:
    int value;
};

// done
class strConstant : public stringExpression
{
public:
    strConstant(string v)
    {
        value = v;
    };

    virtual string evaluateStatement(map<string, int> &symTable)
    {
        return value;
    }

private:
    string value;
};