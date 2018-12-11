
Written by Paschalis Natsidis and Nadège Guiglielmoni.

Biopython (biopython.org) is a Python library designed to facilitate biological computations. It is open source and free to use.

Biopython contains various modules, tools and scripts for bioinformatics use and research. This includes parsers for different bioinformatics file formats (FASTA, Genbank, etc.). This introduction will focus on sequence manipulation.

Like any other Python library, in order to use Biopython it must first be installed then imported.

On your personal Linux computer, where you have admin privileges, you can use Aptitude to install Biopython with the following command line (in shell) :


        sudo apt install python-biopython        (for python v2)
        
        
        sudo apt install python3-biopython       (for python v3)
        
        
On Mac, Windows, or a cluster where you do not have admin privileges, you can use pip :


        pip install biopython        (for python v2)
        
        
        pip3 install biopython       (for python v3)
        
        
Then, the package needs to be imported before you start coding :


```python
import Bio
```

# Handling sequences

The package Biopython is object-oriented, which means that it creates objects that are then affected. All the philosophy of this concept revolves around an object (as is indicated by the concept "object-oriented").


Biopython has a specific class of objects : SeqRecord. The object SeqRecord has several features, called attributes. These attributes are the sequence ID, its name, the sequence itself, and other annotations. When using Biopython, you create a SeqRecord which is then affected by the functions you want to use.

## Creating a sequence

A sequence can be created with Seq(), imported from Bio.Seq


```python
from Bio.Seq import Seq    #to import Seq()

my_seq = Seq('ATTTAGACCAGCCCGTGTCGATTCAGGGTG')
```

Now the sequence 'ATTTAGACCAGCCCGTGTCGATTCAGGGTCG' is stored in the variable my_seq.

## Sequence Input

For example, you can create a SeqRecord by loading a FASTA file that contains some sequences. Biopython provides a Sequence Input/Output interface, SeqIO, to handle inputs and outputs. This interface must be imported to be used :


```python
from Bio import SeqIO   #import SeqIO explicitly from Bio
```

The main function parse(), from SeqIO, can be used to read files such as FASTA files. This function takes as input a filename and a format type, and returns a SeqRecord iterator. Let’s read some sequences: 


```python
for record in SeqIO.parse("LADA.fsa", "fasta"):
    print(record.id)
```

    LADA0A
    LADA0B
    LADA0C
    LADA0D
    LADA0E
    LADA0F
    LADA0G
    LADA0H


Here, the loop **for** iterated over all the SeqRecord objects loaded by parse() in the iterator record, and printed all the sequence IDs. You can see that in the file LADA.fsa, there are 8 sequences, each corresponding to a chromosome. The sequence itself could be called in the same manner with record.seq .

The sequences can then be stored in a data structure, for example a dictionnary :


```python
ladaSeq = {}    # creating the dictionnary ladaSeq

for record in SeqIO.parse("LADA.fsa", "fasta"):
    ladaSeq[record.id] = record.seq
```

All the sequences loaded by parse() have been stored in the dictionnary ladaSeq. You can check that the sequences have been properly added to the dictionnary by printing its keys, which should be the IDs :


```python
ladaSeq.keys()
```




    dict_keys(['LADA0A', 'LADA0B', 'LADA0C', 'LADA0D', 'LADA0E', 'LADA0F', 'LADA0G', 'LADA0H'])



The 8 sequences from LADA.fsa are in the dictionnary ladaSeq.


Now that the sequences from LADA.fsa have been stored in the dictionnary ladaSeq, you can access them using their ID as a key :


```python
ladaSeq['LADA0A']
```




    Seq('CACCTTCTGTATACTATTAGATCTTTAAGTTCAGCGCAGAAAGCCAGTGCCTCT...GGA', SingleLetterAlphabet())



And you can also go through all the sequences in ladaSeq to get their length. To do that, you can use a **for** loop to iterate to iterate over the list of sequence IDs returned by ladaSeq.keys(). 


```python
for seq_id in ladaSeq.keys() :
    print("{0}\t{1}".format(seq_id, len(ladaSeq[seq_id])))
```

    LADA0A	834748
    LADA0B	1066887
    LADA0C	1188101
    LADA0D	1247865
    LADA0E	1410526
    LADA0F	1544839
    LADA0G	1582009
    LADA0H	1826642


Here, the length of the sequence my_seq is 31 nucleotides.

Here, at each turn of the **for** loop,  the variable seq_id takes as a value an ID from the list of IDs given by ladaSeq.keys(). Then, the function print() displays the ID and the length of the sequence corresponding to the ID. 

You may notice the notation in the function print :
- in format are the variables that are to be displayed
- in the first part between "", the string to display, where {0} is to be replaced by the first variable in format, {1} by the second variable
The \t between {0} and {1} indicates to put a tabulation to separate the two variables.

## Sequences = string

The sequence can be treated as a string, so for example you can get the sequence length of my_seq with len() :


```python
len(my_seq)
```




    30



You can also call a subset of the sequence, for example the first nucleotide :


```python
my_seq[0]
```




    'A'



Or the first five nucleotides :


```python
my_seq[0:5]
```




    Seq('ATTTA', Alphabet())



You can count the occurences of a pattern, such as the letter 'A' :


```python
my_seq.count('A')
```




    6



The letter A appears 6 times. 

With the pattern 'TT' :


```python
my_seq.count('TT')
```




    2



The pattern 'TT' appears twice. Note that count() counts non-overlapping patterns. If you look at the sequence 'ATTTAGACCAGCCCGTGTCGATTCAGGGTCG', you could think that at the beginning the pattern 'TT' appears twice in 'ATTTA', which would be the case if the function counted overlapping patterns. Then the total of 'TT' in the whole sequence would be 3. But count() counts non-overlapping patterns, and this is why 'TT' is counted twice in the whole sequence.

# Playing with sequences

The package Biopython provides a variety of functions to play with sequences in a biological way.

## Reverse complement

You can get the complement or reverse complement of a sequence :


```python
my_seq.complement()
```




    Seq('TAAATCTGGTCGGGCACAGCTAAGTCCCAC', Alphabet())




```python
my_seq.reverse_complement()
```




    Seq('CACCCTGAATCGACACGGGCTGGTCTAAAT', Alphabet())



## Translation, traduction

A nucleotide sequence can translated with the function transcribe :


```python
my_seq    #display sequence
my_seq.transcribe() #display ARN
```




    Seq('AUUUAGACCAGCCCGUGUCGAUUCAGGGUG', RNAAlphabet())



But as you may notice, the sequence is just the same as before, only T have been replaced by U. If you want to have the true ARN, you need to use reverse_complement() and transcribe(). You can use both in one line.


```python
my_rna = my_seq.reverse_complement().transcribe() #store RNA in my_arn
my_rna #display my_arn
```




    Seq('CACCCUGAAUCGACACGGGCUGGUCUAAAU', RNAAlphabet())



The RNA can then be translated with the function translate() :


```python
my_rna.translate()
```




    Seq('HPESTRAGLN', ExtendedIUPACProtein())



Note that the sequence length should be a multiple of 3.

# Exercises 

1.What is the length of the sequence LADA0A in the dictionnary ladaSeq? 


2.What is the length of all the sequences of LADA ?


3.What is the total length of the genome of LADA ?


For the sequence LADA0H :


4.Counting DNA Nucleotides : write a script that will count the occurences of the 4 nucleotides in a DNA sequence. What is the GC content?


5.Complementing a strand of DNA : get the reverse complement of LADA0H and count each nucleotide in this sequence.


6.Write in a file the information you computed in .4 and .5 for all the chromosomes in the dictionnary.


For the sequence LADA0A :


7.Find all the restriction enzyme sites "ATGC".
