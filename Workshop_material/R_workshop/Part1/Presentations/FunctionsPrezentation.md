Lecture2: Functions
========================================================
author: Maja Kuzman
date: October 15th 2018
width: 1200
height: 1000
Remarks - markdown
========================================================
{r, eval=FALSE}


```r
Some code that does not run or has an error
```

- echo: no code, just output  
- message  
- warning  

<small>
https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf  
https://rmarkdown.rstudio.com/authoring_basics.html 
</small>

***
![plot of chunk unnamed-chunk-2](FunctionsPrezentation-figure/unnamed-chunk-2-1.png)


Functions
========================================================

    1. Function format: 
    2. Default arguments - default value assigned if argument is not provided   
    3. Return value - last or explicitly specified by return()
```r
functionName <- function(arguments, 
                         argumentWithDefault=someValue) {
        #we do some operations here
        returnedValueComesLast
    }
```
Functions
========================================================
```r
functionName <- function(arguments, 
                         argumentWithDefault=someValue){
        #we do some operations here
        returnedValueComesLast
    }
```
Exercise:
- Write a function fName that will take 2 arguments: x and a.
- Set the default value of a to 5.
- Change x to be double of a. 
- set a new variable y to be x/5.
- return the value of y


Functions
========================================================
4. Function call:
    functionName(realArgument)  

```r
fName <- function(x,a=5){
        x <- 2*a
        y <- x/5
        return(y)
    }
```
***  
Exercise:
- Set the value of x to be 3.
- Call fName with parameters x,10 and save the result in variable res.
- What is the value of res?
- What is the value of x now? Did you expect that?
Functions
========================================================
4. Function call:
    functionName(realArgument)  

```r
fName <- function(x,a=5){
        x <- 2*a
        y <- x/5
        return(y)
    }
```
***  
Solution:

```r
x <- 3
res <- fName(x,10)
res
```

```
[1] 4
```

```r
fName
```

```
function(x,a=5){
        x <- 2*a
        y <- x/5
        return(y)
    }
```
***Note on environments!

Functions
========================================================
Change the function so that tha following code will work as demonstrated:

```r
fName <- function(x,a=5){
        x <- 2*a
        y <- x/5
        return(????)
    }
```
***  
```
lista <- fName(4,10)
lista

$y 
[1] 4

$x
[1] 20
```


Functions
========================================================
If we want to allow for any number of arguments, use ...   

```r
myFunction <- function(..., someArgument){
    y <- unlist(list(...))
    x <- sum(y)/(length(y))
    return(x)
}
```
Functions
========================================================
print only prints, it does not return anything to global environment!

```r
fName <- function(x,a=5){
        x <- 2*a
        print(x)
        y <- x/5
    }
```
***  

```r
fName(1,1)
```

```
[1] 2
```

```r
res <- fName(1,1)
```

```
[1] 2
```
What do you think is saved in res?

Functions
========================================================
You can write a message using print, message

```r
fName <- function(x,a=5){
        x <- 2*a
        message("X changed, it is now: ",x)
        y <- x/5
    }
```
1) Try what this will produce:

```r
res <- fName(1,1)
```
2) What is stored in res?


Functions
========================================================
Throw a warning

```r
fName <- function(x,a=5){
        x <- 2*a
        warning("X changed, it is now: ",x)
        y <- x/5
    }
```
1) Try what this will produce:

```r
res2 <- fName(1,1)
```
2) What is stored in res2?
3) Warnings are saved !

```r
warnings()
```

Exercise 1: 5 min
========================================================
Write a function that will take one argument, you can assume it will be a vector, and: 
- print all occurences of all elements in that vector. (Use function table.) 
- The function should return a number of elements in the vector.  

Advanced:  
+
The function should take any number of elements as arguments and also produce a plot of that table.   
More advanced:  
++
The function should return the number of elements that appear in at least 2 vectors.   

Flow control
========================================================
What is flow control in programming?  

Example: guide an angry bird to the pig by giving it commands!  
https://studio.code.org/hoc/3 

Flow control
========================================================

Solution:  
Go forward until you reach the wall. Then turn right and forward again.  

Programming language:   
go forward; have you reached the wall?  
-> yes: turn right  
-> no: go forward  

Flow control
========================================================
This is acchieved by LOOPS and CONDITIONS!  
Loops in R: repeat, while, for  
Conditions: if, if - else, ifelse  

```r
repeat {
     goForward
     if (wallInFront) {
          turnRight
     }
     if (eatAPig) 
          break
}
```
     
Flow control
========================================================
This is acchieved by LOOPS and CONDITIONS!  
Loops in R: repeat, while, for  
Conditions: if, if - else, ifelse  

```r
OKtoGo <- TRUE
while (OKtoGo){
     goForward
     if (wallInFront) {
          OKtoGo <- FALSE
          turnRight
     }
}
```

Flow control
========================================================
This is acchieved by LOOPS and CONDITIONS!  
Loops in R: repeat, while, for  
Conditions: if, if - else, ifelse  

```r
for (i in 1:5){
     goForward
     if (wallInFront) {
          turnRight
     }
}
```

Flow control
========================================================
This is acchieved by LOOPS and CONDITIONS!  
Loops in R: repeat, while, for  
Conditions: if, if - else, ifelse  

```r
for (i in 1:5){
     if(wallInFront){
          turnRight
     }else{
          goForward
     }
}
```

Flow control - for loop in R
========================================================
Example 1:  
Sum all the elements of the list that are larger than 2. Use the for loop. "Iterate" through list by using index of the elements. 


```r
x <- list(1,2,3,1,5,7)
x
suma=0
for (i in 1:length(x)){
     el <- x[[i]]
     if(el > 2)
          suma = suma + el
}
```
Flow control - for loop in R
========================================================

```r
x <- list(1,2,3,1,5,7)
x
suma=0
for (i in 1:length(x)){
     el <- x[[i]]
     if(el > 2)
          suma = suma + el
}
suma
```
Exercise:    
Sum all the elements of the list that are larger than 2. Use the for loop. "Iterate" through list by using THE ELEMENTS THEMSELVES! 

Flow control - for loop in R
========================================================
Exercise loops:    
Sum all the elements of the list that are larger than 2. Use the for loop. "Iterate" through list by using THE ELEMENTS THEMSELVES!   

```r
x <- list(1,2,3,1,5,7)
x
suma=0
for (el in x){
     if(el > 2)
          suma = suma + el
}
suma
```

Loops are slow. AVOID USING LOOPS IN R! 
========================================================

```r
library(Rcpp)

 cppFunction('int addCpp(int x) {
     int suma = 0;
   for (int i = 1; i <= x; i++){
     suma += 1;
   }
   return suma;
 }')

addR <- function(x){
    suma=0
    for (i in 1:x){
        suma = suma + 1 
    }
    suma
}
system.time(addCpp(500000000))
```

```
   user  system elapsed 
      0       0       0 
```

```r
system.time(addR(500000000))
```

```
   user  system elapsed 
  31.03    0.03   31.63 
```


Loops are slow.
========================================================

```r
x <- list(1,2,3,1,5,7)
```


```r
sum(x[x>2])
```

```r
y <- unlist(x)
sum(y[y>2])
```

```
[1] 15
```

Flow control - sapply R
========================================================
Exercise - sapply, 2 min:  
Write a function proberi that will return the sum of all elements larger then 2 from a vector.  

```r
x <- list(A=c(1,2,3,4,5),
          B=c(1,3,5),
          C=1)
x
```

```
$A
[1] 1 2 3 4 5

$B
[1] 1 3 5

$C
[1] 1
```
How would you use sapply to get the sum of al elements larger then 2:  

```r
sapply(x,proberi)
```

Flow control - sapply R
========================================================
Exercise - sapply:  
Write a function proberi that will return the sum of all elements larger then 2 from a vector.  

```r
proberi <- function(x){
     sum(x[x>2])
}
```
How would you use sapply to get the sum of al elements larger then 2:  

```r
sapply(x,proberi)
```

```
 A  B  C 
12  8  0 
```



Exercise loops 2
========================================================
Get the length of all elements of x - use for loop and then lapply and sapply functions.

```r
x
```

```
$A
[1] 1 2 3 4 5

$B
[1] 1 3 5

$C
[1] 1
```

Exercise loops 2
========================================================
Get the length of all elements of x - use for loop and then lapply and sapply functions.

```r
x
```

```
$A
[1] 1 2 3 4 5

$B
[1] 1 3 5

$C
[1] 1
```
***

```r
for (i in x) {print(length(i))}
```

```
[1] 5
[1] 3
[1] 1
```

```r
sapply(x, length)
```

```
A B C 
5 3 1 
```

```r
lapply(x,length)
```

```
$A
[1] 5

$B
[1] 3

$C
[1] 1
```


Exercise 2 :pi estimation, 10 min
========================================================
- Create a data frame like in pi estimation exercise, with 1 000 000 random x and y cordinates from -1 to 1. (use function runif )  
- Add a column insideCircle which will say TRUE if point x,y belongs to a circle within the square (x^2+y^2<=1)  
- Add a column that will represent groups - create 10 different groups of eaqual sizes. We will calculate % of error for each group separately to see if we can assess the overall error variance.  
- Use function split to split the data frame into 10 different data frames based on group.  
- calculate % error for each group using sapply.  

Extra: Repeat everything for 50 groups instead of 10. How variable are results compared to 10 groups - calculate mean and sd and comment?  

Exercise 2 :pi estimation, 10 min
========================================================
- Create a data frame like in pi estimation exercise, with 1 000 000 random x and y cordinates from -1 to 1.

```r
set.seed(1234)
ddf <- data.frame(x = runif(n = 1000000,-1,1), y=runif(n = 1000000,-1,1))
head(ddf)
```

```
           x          y
1 -0.7725932 -0.6618851
2  0.2445988 -0.2041903
3  0.2185495  0.6059561
4  0.2467589 -0.3694550
5  0.7218308 -0.5909273
6  0.2806212  0.1858141
```
Exercise 2 :pi estimation, 10 min
========================================================

- Add a column insideCircle which will say TRUE if point x,y belongs to a circle within the square (x^2+y^2<=1)  

```r
ddf$insideCircle <- ((ddf$x^2 + ddf$y^2 )<=1)
```

Exercise 2 :pi estimation, 10 min
========================================================
- Add a column that will represent groups - create 10 different groups of eaqual sizes. We will calculate % of error for each group separately to see if we can assess the overall error variance.   

```r
ddf$group <- cut(1:1000000,10)
table(ddf$group)
```

```

 (-999,1e+05] (1e+05,2e+05] (2e+05,3e+05] (3e+05,4e+05] (4e+05,5e+05] 
       100000        100000        100000        100000        100000 
(5e+05,6e+05] (6e+05,7e+05] (7e+05,8e+05] (8e+05,9e+05] (9e+05,1e+06] 
       100000        100000        100000        100000        100000 
```

- Use function split to split the data frame into 10 different data frames based on group.  

```r
listaDdf <- split(ddf, ddf$group)
str(listaDdf[1:2])
```

```
List of 2
 $ (-999,1e+05] :'data.frame':	100000 obs. of  4 variables:
  ..$ x           : num [1:100000] -0.773 0.245 0.219 0.247 0.722 ...
  ..$ y           : num [1:100000] -0.662 -0.204 0.606 -0.369 -0.591 ...
  ..$ insideCircle: logi [1:100000] FALSE TRUE TRUE TRUE TRUE TRUE ...
  ..$ group       : Factor w/ 10 levels "(-999,1e+05]",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ (1e+05,2e+05]:'data.frame':	100000 obs. of  4 variables:
  ..$ x           : num [1:100000] 0.3763 -0.5999 0.0199 0.9791 0.8061 ...
  ..$ y           : num [1:100000] -0.679 0.114 0.724 0.28 0.481 ...
  ..$ insideCircle: logi [1:100000] TRUE TRUE TRUE FALSE TRUE TRUE ...
  ..$ group       : Factor w/ 10 levels "(-999,1e+05]",..: 2 2 2 2 2 2 2 2 2 2 ...
```
Exercise 2 :pi estimation, 10 min
========================================================

- calculate % error for each group using sapply.  

```r
differenceFromPi <- function(x){
     piEstimate <- (mean(x$insideCircle)*4)
     abs(piEstimate-pi)/pi*100
}
tenGroups <- sapply(listaDdf, differenceFromPi)
```

Exercise 2 :pi estimation, 10 min
========================================================
Extra part: Repeat everything for 50 groups instead of 10.  

```r
ddf$group50 <- cut(1:1000000,50)
fiftyGroups <- sapply(split(ddf, ddf$group50), differenceFromPi)
```
***  
How variable are results compared to 10 groups?  

```r
mean(tenGroups)
```

```
[1] 0.145009
```

```r
sd(tenGroups)
```

```
[1] 0.1124716
```

```r
mean(fiftyGroups)
```

```
[1] 0.2708705
```

```r
sd(fiftyGroups)
```

```
[1] 0.1694307
```


