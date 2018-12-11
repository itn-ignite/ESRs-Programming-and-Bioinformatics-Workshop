# Requirements:

[R](https://cloud.r-project.org/)
[Rstudio](https://www.rstudio.com/products/rstudio/download/#download)

```{r}

install.packages(c("data.table","BiocManager", "tidyverse", "plotly", "shiny", "stringr"))

BiocManager::install(c("IRanges", "GenomicRanges", "Biostrings", "biomaRt", "ggbio","BSgenome","xaringan"))


```

# Outline: 
## 9 - 10:30  

### Introduction to R:  
- R, RStudio, Rmd  
- Data structures basics:
     - subsetting vectors,
     - subseting data frames  
- Basic functions examples  
- Flow control

## 10:50 - 12:

### Functions  
- Estimate Pi example  
- Functions in R  

## 12-13
- Loops    
- cpp loops in R  
- apply and variations  

## 14-16  

### Data manipulation  
- tidyr
- data.table  

## 16:30 - 18:30  
### Data visualization    
- ggplot2    

## 19:30 - 21:30  
- Exercises : data manipulation and visualization:
     Basic:  reproduce plots - workshop preferences analysis  
     Exercise 2: reproduce plots - LTR analysis  
     Solution to Workshop preferences analysis  
     
 
## 9 - 10:00  

1. Algorithms - kmeans exercise  
     -> advanced: solve it by data.table   

## 10 - 11:50  

2. Motivation for bioconductor  
     Exercise - BLAST result example  

## 12 - 13  

3. Bioconductor - IRanges  

## 14 - 16  

4. Bioconductor: GenomicRanges  
     Exercise - BLAST result solved by GRanges  

## 16:30 - 18:30 

5. Biostrings  
     Exercise: DotPlot  

## 19:30 - 21:30  

Algorithms : Random forests  
+ Example on sponges  


