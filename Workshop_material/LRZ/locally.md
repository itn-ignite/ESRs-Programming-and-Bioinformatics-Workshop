# Installing tools locally
If for any reason you need to install locally (*no having sudo privilages*) here are some ways to do it.

## Installing using a prefix
Most of the program will need to be configure before installing. In the configuration specify where to install the program.  

1- Specify the PATH to install the program.  
```bash
./configure --prefix=/path/you/want/the/program
```  

2- Now we need to run the make command.  
```bash  
make  
```  

3- Mow run maek install to install the program in our desire PATH.  
```bash
make install
```  

Programs are install in the PATH specify in the configure step (#1).  

4- (OPTIONAL) You can them edit your `.bashrc` to add the location of the program to your PATH.   

**Other options**
- Go to the folder and run the program.      
```bash
cd /path/of/the/program  
```   
```bash
./program
```  

- Call the program from the folder you are working on.  
```bash
./path/of/the/program/program_name
```  

- Create a temporary variable for the program (*e.g.* for using in a script).  
```bash
myprogram=/path/of/the/program/program_name
```   
Now when you type the name of your variable using a `$` before the name the program will run.   
```bash
$myprogram
```  
Note: This variable is not going to be available save for future session. If you log out and in you will not have it anymore.  

## Using conda  
Directly from their [webpage](https://conda.io/docs/)
"Conda is an open source package management system and environment management system that runs on Windows, macOS and Linux."  

It is a very useful tool, specially becasue you can use conda to install locally. Is that the case, "why I need to bother in learning how to install locally" you may say. Simply, not all the programs are in conda. However, you will see that the common are available and constantöy more programs are added.    

Here we are not going to explain how to install conda since the documentation provided in their page is very detailed and step by step. We are going to show  you how install programs when  you already have conda (or miniconda).  Here is a conda [cheat sheet](https://conda.io/docs/_downloads/conda-cheatsheet.pdf) for reference too.  

1- Check in the [repositories](https://anaconda.org/anaconda/repo) if your program is available.  

![](https://i.imgur.com/SXscRwF.png)  
.  
.  
2- In this example we are interested on installing [ABySS](http://www.bcgsc.ca/platform/bioinfo/software/abyss) (genome assembly program).  

![](https://i.imgur.com/m1lIQXw.png)  
.  
.  
3- You will have a couple of options. We are interested only in ABySS for now and not transABySS (trasncriptome assembly). Let's take the first option since is the last update and most downloaded (thats a good sign).  

![](https://i.imgur.com/nGs05UL.png)  
.  
.  
4- As you can see in the photo above the page is telling what you need to do to install ABySS using conda.
```bash
 conda install -c bioconda abyss 
 ```  
 
 Automatically conda will show you the programs that is going to install (*i.e.* ABySS and its dependencies). Accept this by typing `y` and the program will install.  
 
 **NOTE:** When installing multiple programs the version of their dependencies could be different. Sometimes you will see messages like this:  
```bash
The following packages will be UPDATED:

    blast:        2.6.0-boost1.60_0  bioconda --> 2.6.0-boost1.61_1 bioconda

The following packages will be DOWNGRADED due to dependency conflicts:

    augustus:     3.2.3-boost1.60_0  bioconda --> 3.2.2-boost1.61_3 bioconda
    
```  

This could make some tools not to work because of different versions that they may need. A solution for that is either create conda [enviroments.](https://conda.io/docs/user-guide/getting-started.html#managing-environments)  








