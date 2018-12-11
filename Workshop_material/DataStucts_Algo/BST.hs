-- Haskell implementation for a Binary Search Tree. To run this program
-- from the terminal :
--
--     > runghc BST.hs
--
-- or from the interpreter with :
--
--     > ghci BST.hs
--
-- This code is for educational purposes, and has not been thoroughly
-- checked for errors.
--
-- IGNITE ESR Winter Workshop
-- Split 2018
--
--

module BST where



-- Declare the data type for BSTs.
data BST a = E
           | T a (BST a) (BST a)



-- Define how a BST should be represented as a string.
instance Show a => Show (BST a) where
  show t = case t of
    E       -> ""
    T k l r -> show l ++ " " ++ show k ++ " " ++ show r



-- Predicate for empty tree.
isEmpty :: BST a -> Bool
isEmpty t = case t of
  E -> True
  _ -> False


-- Try to find a value in a BST.
find :: Ord a => a -> BST a -> Maybe a
find x t = case t of
  E        -> Nothing
  T k l r -> case compare x k of
               LT -> find x l
               EQ -> Just k
               GT -> find x r


-- Insert a value into a BST.
insert :: Ord a => a -> BST a -> BST a
insert x t = case t of
  E        -> T x E E
  T k l r -> case compare x k of
               LT -> T k (insert x l) r
               EQ -> t
               GT -> T k l (insert x r)



-- Delete the max element from a BST, and return this
-- element along with the modified BST.
delMax :: Ord a => BST a -> (a, BST a)
delMax t = case t of
  T k l E -> (k,l)
  T k l r -> let (k',r') = delMax r
             in (k', T k l r')



-- Wrapper to get to the correct location of the node
-- that will be deleted. Once located, calls delNode.
delete :: Ord a => a -> BST a -> BST a
delete x t = case t of
  E        -> E
  T k l r -> case compare x k of
               LT -> T k (delete x l) r
               EQ -> if isEmpty r
                        then l
                        else if isEmpty l
                                then r
                                else let (k',l') = delMax l
                                     in T k' l' r
               GT -> T k l (delete x r)



-- Helper to read in a list of values into a tree.
fromList :: Ord a => [a] -> BST a
fromList = foldl (\ acc x -> insert x acc) E



-- This is where you can play with the program. Change the body
-- of main to test the default functions, or call custom functions
-- that you have built.
main :: IO ()
main = do

  ----------------------------------------------------------------------------
  --  Your functions can be called here.

  let root0 = fromList [5,2,7,1,4,6,8]
  let root1 = delete 5 root0
  putStrLn $ show root0
  putStrLn $ show root1
  putStrLn $ show $ find 5 root1
  putStrLn $ show $ find 6 root1

  -- End of your function calls.
  ----------------------------------------------------------------------------


