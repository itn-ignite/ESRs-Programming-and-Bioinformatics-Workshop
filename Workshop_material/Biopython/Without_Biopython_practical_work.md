
Written by Nadège Guiglielmoni.

This notebook explains how to do part of what Biopython functions do without Biopython.

# Parsing a fasta file

First, you need to open the lines :


```python
f = open("LADA.fsa")
```

Then you have to load your lines in a variable with readlines(). The lines are stored in a list in 'lines'.


```python
lines = f.readlines()
```

You can iterate over all the lines of your file stored in the variable 'lines' :


```python
for line in lines :
    if ">" in line :
        print(line)
```

    >LADA0A Lachancea dasiensis CBS10888 chromosome A, complete assembly
    
    >LADA0B Lachancea dasiensis CBS10888 chromosome B, complete assembly
    
    >LADA0C Lachancea dasiensis CBS10888 chromosome C, complete assembly
    
    >LADA0D Lachancea dasiensis CBS10888 chromosome D, complete assembly
    
    >LADA0E Lachancea dasiensis CBS10888 chromosome E, complete assembly
    
    >LADA0F Lachancea dasiensis CBS10888 chromosome F, complete assembly
    
    >LADA0G Lachancea dasiensis CBS10888 chromosome G, complete assembly
    
    >LADA0H Lachancea dasiensis CBS10888 chromosome H, complete assembly
    


Here, for each line, if the line matches the symbol ">", the line is printed. The symbol ">" preceeds the name of a sequence in a fasta file, so checking for ">" is the way to identify the name of a sequence in a fasta file.

Now, you can take away the line that follows each name and the symbol ">" :


```python
for line in lines :
    if ">" in line :
        print(line.strip().strip(">"))
```

    LADA0A Lachancea dasiensis CBS10888 chromosome A, complete assembly
    LADA0B Lachancea dasiensis CBS10888 chromosome B, complete assembly
    LADA0C Lachancea dasiensis CBS10888 chromosome C, complete assembly
    LADA0D Lachancea dasiensis CBS10888 chromosome D, complete assembly
    LADA0E Lachancea dasiensis CBS10888 chromosome E, complete assembly
    LADA0F Lachancea dasiensis CBS10888 chromosome F, complete assembly
    LADA0G Lachancea dasiensis CBS10888 chromosome G, complete assembly
    LADA0H Lachancea dasiensis CBS10888 chromosome H, complete assembly


Now you can select only the short name of the sequence by splitting the name (by default at each space). The function split() gives a list as an output. You can select the first element of the list, with the indice 0, to get the short name :


```python
for line in lines :
    if ">" in line :
        print(line.strip().strip(">").split()[0])
```

    LADA0A
    LADA0B
    LADA0C
    LADA0D
    LADA0E
    LADA0F
    LADA0G
    LADA0H


When you know how to detect a sequence name, it is then easy to store the sequence with its name :


```python
# creating a dictionnary to store the sequences in
ladaSeq = {} 

# creating the variables in which the name and 
# sequence are stored
seq_name = None
full_seq = ""

# iterating over all the lines in the file
for line in lines :
    
    # SEQUENCE NAME
    if ">" in line :
        
        # everytime there is a new sequence the
        # current sequence stored in seq_name
        # and full_seq are added to the ladaSeq
        # dictionnary
        if seq_name is not None :
            ladaSeq[seq_name] = full_seq 
            
        # seq_name takes the new name as value
        seq_name = line.strip().strip(">").split()[0]
        full_seq = ""
        
    # SEQUENCE
    # each line with sequence is added to full_seq
    else :
        full_seq = full_seq + line.strip()

# store the last remaining sequence
ladaSeq[seq_name] = full_seq 
```

The sequences are stored in the dictionnary ladaSeq. seq_name keeps the current seq_name, and full_seq keeps the current sequence. A sequence can be splitted over several lines, that is why you have to iterate over the lines, add each line to the sequence, until you find a line with a new sequence name. When there is a new sequence name, the sequence that has been stored in full_seq is saved with the corresponding sequence name. Then, full_seq is reinitialized and seq_name is updated with the new name.

You can check that all the sequences have been loaded properly by taking a look at the keys of ladaSeq.


```python
ladaSeq.keys()
```




    dict_keys(['LADA0A', 'LADA0B', 'LADA0C', 'LADA0D', 'LADA0E', 'LADA0F', 'LADA0G', 'LADA0H'])


