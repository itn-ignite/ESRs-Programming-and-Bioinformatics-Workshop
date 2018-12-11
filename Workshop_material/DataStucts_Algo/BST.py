#  Python implementation for a Binary Search Tree. To run this program
#  from the terminal :
#
#      > python BST.py
#
#  or from the interpreter with :
#
#      > python -i BST.py
#
#  This code is for educational purposes, and has not been thoroughly
#  checked for errors.
#
#  IGNITE ESR Winter Workshop
#  Split 2018
#
#

#-- Define a Binary Search Tree (BST) object.
class BST:

  #-- Initialize a Tree BST.
  def __init__(self, val):
    #- The value of the BST.
    self.val   = val
    #- The left subtree.
    self.left  = None
    #- The right subtree.
    self.right = None



  #-- Display the BST in order.
  def __str__(self):
    res = ''
    if self.left != None:
      res += str(self.left)
    res += ' ' + str(self.val)
    if self.right != None:
      res += str(self.right)
    return res



  #-- Insert a value into a Tree recursively.
  def insert(self, val):
    #-- When the value of the node we are at is empty,
    #   we can just insert the value directly.
    if self.val is None:
      self.val = val
    #-- When the node is already filled, we need to recurse.
    else:
      #-- Check to see if we need to go down the left branch.
      if val < self.val:
        #-- Make a BST if one has not already been created
        if self.left is None:
          self.left = BST(val)
        #-- Otherwise just recurse.
        else:
          self.left.insert(val)
      #-- Otherwise we need to go down the right branch.
      else:
        #-- Make a BST if one has not already been created
        if self.right is None:
          self.right = BST(val)
        #-- Otherwise just recurse.
        else:
          self.right.insert(val)



  #-- Try to find an element in the tree.
  def find(self, val):
    #-- If we have found the element, then return it.
    if val == self.val:
      return self.val
    #-- Otherwise, we must recurse.
    else:
      #-- Check to see if we need to recurse on the left branch.
      if val < self.val:
        #-- If the left subtree is empty, the element cannot be a
        #   member of the BST.
        if self.left is None:
          return None
        #-- Otherwise recurse.
        else:
          return self.left.find(val)
      #-- Otherwise we need to recurse on the right branch.
      else:
        #-- If the right subtree is empty, the element cannot be a
        #   member of the BST.
        if self.right is None:
          return None
        #-- Otherwise recurse.
        else:
          return self.right.find(val)



  #-- Delete an element from the tree.
  def delete(self, val):
    #-- There are 3 cases to consider when deleting.
    if val == self.val:

      #-- Case 1 : When there are no child nodes, we can
      #   safely remove the entire node.
      if self.left == None and self.right == None:
        self = None

      #-- Case 2 : When there is only 1 child node, we can
      #   replace the current node with the child.
      elif self.right == None:
        self = self.left
      elif self.left == None:
        self = self.right

      #-- Case 3 : When there are 2 child node, we have to do some
      #   work. The first step is to find the successor node, which
      #   is the node that is the immediate successor for the value of
      #   the current element. In other words, the leftmost inner child
      #   of the right node. Replace the current node with the successor,
      #   and delete the successor.
      else:
        parent, successor = self, self.right
        while successor.left:
          parent, successor = successor, successor.left
        self.val = successor.val
        if parent.left == successor:
          parent.left = successor.right
        else:
          parent.right = successor.right

    #-- Check to see if we need to recurse right.
    elif val < self.val and self.left != None:
      return self.left.delete(val)
    #-- Check to see if we need to recurse left.
    elif val > self.val and self.right != None:
      return self.right.delete(val)
    #-- We made it to the end, do nothing.
    else:
      return



#-----------------------------------------------------------------------------
# This is where you can play with the program. Change the body
# of main to test the default functions, or call custom functions
# that you have built.
def main():

  root = BST(5)
  root.insert(2)
  root.insert(8)
  root.insert(3)
  root.insert(1)
  root.insert(6)
  root.insert(10)
  root.delete(2)
  print(str(root))

#-----------------------------------------------------------------------------



# execute only if run as a script
if __name__ == "__main__":
    main()



