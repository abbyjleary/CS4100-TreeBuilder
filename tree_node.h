#include <vector>
#include <string>

using namespace std;

struct treeNode {
    string name;
    int weight;
    vector<treeNode*> children;
};