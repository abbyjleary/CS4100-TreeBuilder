#include <string>
#include <vector>
#include <iostream>

using namespace std;


struct treeNode
{
    char* name;
    int weight;
    vector<treeNode *> children;
};

void printTree(treeNode *root)
{
    cout << "("
         << "<" << root->name << "," << root->weight << ">";
    if (!root->children.empty())
    {
        cout << ",";
    }
    for (int i = 0; i < root->children.size(); i++)
    {
        printTree(root->children[i]);
        if (i != root->children.size() - 1)
        {
            cout << ",";
        }
    }
    cout << ")";
    // doesnt fully work i fear
};
