#include "tree_node.h"
#include <vector>

using namespace std;

treeNode* addNode(char* name, int weight, char* parentName, treeNode* tree) {
    if (parentName == NULL){ //update root
        treeNode newRoot;
        newRoot.name = name;
        newRoot.weight = weight;

        tree = newRoot;
    }
    else { //find parent and add child
        if (tree->name == parentName){
            treeNode newNode;
            newNode.name = name;
            newNode.weight = weight;

            tree->children.push_back(*newNode);
        }
        else { //recursive call to search children
            for (size_t i = 0; i < (tree->children).size(); i++){
                addNode(name, weight, parentName, (tree->children).at(i));
            }
        }
    }
    

    return tree;
}

int addition(int num1, int num2){
    return num1 + num2;
}

string concat(string string1, string string2){
    return string1 + string2;
}

treeNode* intLoop( string varName, int start, int stop ){

}