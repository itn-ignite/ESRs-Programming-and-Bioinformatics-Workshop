/* C Implementation for a Binary Search Tree. To run this program
 * from the terminal :
 *
 *     > gcc BST.c -o main; ./main
 *
 * This code is for educational purposes, and has not been thoroughly
 * checked for errors.
 *
 * IGNITE ESR Winter Workshop
 * Split 2018
 *
 */


#include <stdio.h>
#include <stdlib.h>


// Define the structure for a tree node.
struct node {
    int key;
    struct node* left;
    struct node* right;
};



// Create a fresh node structure.
struct node* makeNode(int item) {
    struct node* temp = (struct node*) malloc(sizeof(struct node));
    temp->key   = item;
    temp->left  = NULL;
    temp->right = NULL;
    return temp;
}



// Display the tree nodes in order.
void show(struct node* root) {
    if (root != NULL) {
        show(root->left);
        printf("%d ", root->key);
        show(root->right);
    }
}


// Try to find a value in the tree. If found, return 1; otherwise
// return 0.
int find(int key, struct node* root) {
    // If we hit an empty tree, the value does not exist.
    if (root == NULL) return 0;

    // If we find the key, stop recursing and return true.
    if (root->key == key) return 1;

    // Otherwise recurse to the correct spot in the tree.
    if (key < root->key) {
        find(key, root->left);
    } else {
        find(key, root->right);
    }
}


// Insert a new key into the tree.
struct node* insert(int key, struct node* root) {
    // If the location in the tree is empty, just make a new node.
    if (root == NULL) return makeNode(key);

    // Otherwise recurse to the correct spot in the tree.
    if (key < root->key) {
        root->left = insert(key, root->left);
    } else {
        root->right = insert(key, root->right);
    }

    // Return the result tree.
    return root;
}



// Delete an individual node structure and cleanup dirty memory.
struct node* delNode(struct node* root) {
    // If the node has no children, we can just free the memory.
    if (root->left == NULL && root->right == NULL) {
        free(root);
        return NULL;
    }

    // If the node has a single child, we can just replace the
    // deleted node with the child.
    else if (root->right == NULL) {
        struct node* tmp = root->left;
        free(root);
        return tmp;
    } else if (root->left == NULL) {
        struct node* tmp = root->right;
        free(root);
        return tmp;
    }

    // Otherwise we have 2 child nodes. In this case, we replace
    // the deleted node with it's successor.
    else {
        // Find the successor.
        struct node* successor = root->right;
        struct node* parent = NULL;
        while (successor->left != NULL) {
            successor = successor->right;
            parent = successor;
        }
        // Replace the deleted node.
        root->key = successor->key;
        // Cleanup the dirty tree.
        free(successor);
        if (parent != NULL) {
            parent->left = NULL;
        } else {
            root->right = NULL;
        }
        return root;
    }
}



// Delete a node from the tree. This function is just a
// wrapper to get us to the right node in the tree.
struct node* delete(int key, struct node* root) {

    // If the tree is already empty, we can't delete anything.
    if (root == NULL) return root;

    // Traverse the tree to get to the correct node. Once found,
    // call the delNode function to actually delete the node.
    if (key < root->key) {
        root->left = delete(key, root->left);
    } else if (key > root->key) {
        root->right = delete(key, root->right);
    } else {
        root = delNode(root);
    }

    // Return the resulting tree.
    return root;
}



/* This is where you can play with the program. Change the body
 * of main to test the default functions, or call custom functions
 * that you have built.
 */
int main() {

    // Initialize your tree and set the root node to
    // an initial default value.
    struct node* root = NULL;
    root = insert(50,root);

    //------------------------------------------------------------------------
    // Your functions can be called here.

    insert(30,root);
    insert(20,root);
    insert(40,root);
    insert(70,root);
    insert(60,root);
    insert(80,root);
    insert(45,root);
    show(root);
    printf("\n");

    delete(40,root);
    show(root);
    printf("\n");

    printf("%d\n", find(40,root));
    printf("%d\n", find(45,root));


    // End of your function calls.
    //------------------------------------------------------------------------

    // Return without errors.
    return 0;
}


