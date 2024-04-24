#include "tree_node.h"

using namespace std;


int main(){
    
treeNode A;
A.name = "A";
A.weight = 2;

treeNode B;
B.name = "B";
B.weight = 2;

treeNode C;
C.name = "C";
C.weight = 3;

treeNode D;
D.name = "D";
D.weight = 4;

treeNode E;
E.name = "E";
E.weight = 4;

treeNode F;
F.name = "F";
F.weight = 4;

C.children.push_back(&F);
C.children.push_back(&E);
C.children.push_back(&D);

B.children.push_back(&C);

treeNode root;
root.name = "root";
root.weight = 5;
root.children.push_back(&C);
root.children.push_back(&B);
root.children.push_back(&A);

printTree(&root);


}