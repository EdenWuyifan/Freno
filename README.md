# Freno
##### Olivier G. Marin, Jingyi (Jenny) Zhu, Yifan (Eden) Wu


## Abstract
  Freno is an incremental and easily distributable prefix tree of frequent itemsets. The tree has an empty root node, first-level nodes for the unique items in the dataset and nodes for all the frequent itemsets in a canonical order. The key of a tree node is either an item or a frequent itemset. After the tree is fully built, we can simply retrieve the frequent itemsets by traversing the tree and filtering out the infrequent first-level nodes. Freno keeps an accurate count of the infrequent items and itemsets so as to grow the tree on incrementally added transactions. Unlike FP-tree which links its tree nodes horizontally, Freno tree only has the parent-child link between the its nodes. As a result, Freno tree can be fully distributed.

## How to Use
  We presented both centralized and distributed Freno. Centrailized Freno is base on Python, distributed Freno can be mounted both on MPI and Spark (Spark version is not recommended since it will hinder its performance). 

### Before Launching Freno

#### Get Dataset Files
  Before running scripts, we need to download the datasets file to our home directory (_./Freno_). 
  The download link is here: https://drive.google.com/drive/folders/1mV72ylzwMnR5RArd4UBDXEn2psW5wXC8?usp=sharing
  We need to put the incdatasets file under _./Freno_

  
#### Change Configurations
  Before going to the expiriment scripts, we need to set the variables from Freno/config.sh. The details are as follow:
   * **$experiment** is the current experiment: 
     + "Freno" for MPI Freno; 
     + "SpFreno" for Spark Freno; 
     + "IncSpFreno" for incremental Spark Freno; 
     + "centFreno" for centralized Freno.
   * **$expnum** is how many times we want to run a single experiment (7, 11, 13 is recommended for computing trusted mean value).
   * **$target** is the purpose of the experiments, using "perf" for measuring performances.
   * **$dataset** is the dataset we want to get Frequent Itemset from: 
     + "retail" is [retail](http://www.philippe-fournier-viger.com/spmf/datasets/retail.txt);
     + "kosarak" is [kosarak](http://www.philippe-fournier-viger.com/spmf/datasets/kosarak.dat);
     + "chainstore" is [chainstoreFIM](http://www.philippe-fournier-viger.com/spmf/datasets/chainstoreFIM.txt);
     + "record" is [RecordLink](http://www.philippe-fournier-viger.com/spmf/datasets/RecordLink.txt).



### Centralised Freno
  Centrailized version of Freno can be performed with on machine with a single thread. 

### MPI Distributed Freno
  MPI version of Freno can be launched under any version of MPI (we are using MPICH2 and MPI4py). We need to install MPICH for cluster building and MPI4py for executing the experiments. 
  Here's a simple tutoral for MPI cluster building: https://mpitutorial.com/tutorials/running-an-mpi-cluster-within-a-lan/
  
  


### Spark Distributed Freno
