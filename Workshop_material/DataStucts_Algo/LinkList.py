#  Python implementation for a Linked List. To run this program from the terminal :
#
#      > python LinkList.py
#
#  or from the interpreter with :
#
#      > python -i LinkList.py
#
#  This code is for educational purposes, and has not been thoroughly checked for errors.
#
#  IGNITE ESR Winter Workshop Split 2018
#
#

#-- Define a Linked List object.
class LinkList:

  #-- Initialize a Linked Liss
  def __init__(self, val):
    #- The value of the Cell.
    self.val   = val
    #- The rest of the list.
    self.tail  = None



  #-- Display the LinkList in order.
  def __str__(self):
    res = ''
    if not self is None and not self.tail is None:
      res += str(self.val) + ' ' + str(self.tail)
    return res



  #-- Insert a value into a List.
  def insert(self, val):
    if self.val is None:
      self.val = val
    #-- When the node is already filled, we prepend it.
    else:
      tmp = LinkList(self.val)
      tmp.tail = self.tail
      self.val = val
      self.tail = tmp



  #-- Try to find an element in the list.
  def find(self, val):
    #-- If we have found the element, then return it.
    if val == self.val:
      return True
    #-- Otherwise, we must recurse.
    elif self.tail != None:
       return self.tail.find(val)
    #-- We have traversed the list and did not find.
    else:
       return False



  #-- Delete an element from the list.
  def delete(self, val):
    parent  = None
    current = self

    while current:
      if current.val == val:
        if parent:
          parent.tail = current.tail
        else:
          self = current.tail

      parent  = current
      current = current.tail



#-----------------------------------------------------------------------------
# This is where you can play with the program. Change the body
# of main to test the default functions, or call custom functions
# that you have built.
def main():

  root = LinkList(5)
  root.insert(2)
  root.insert(8)
  root.insert(3)
  root.insert(1)
  root.insert(6)
  root.insert(10)
  print(str(root))
  print(str(root.find(1)))
  print(str(root.find(7)))
  root.delete(1)
  root.delete(2)
  print(str(root))

#-----------------------------------------------------------------------------



# execute only if run as a script
if __name__ == "__main__":
    main()



