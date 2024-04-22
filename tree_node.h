#include <vector>
#include <string>
#include <iostream>

using namespace std;

struct treeNode {
    string name;
    int weight;
    vector<treeNode*> children;
};


struct nodeArgs {
    char* name;
    int weight;
    char* isachildof;

};

struct var {
    char* str;
    int num;
};