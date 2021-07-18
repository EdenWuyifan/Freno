# Freno
##### Olivier G. Marin, Jingyi (Jenny) Zhu, Yifan (Eden) Wu

[toc]

## Abstract
Freno is an incremental and easily distributable prefix tree of frequent itemsets. The tree has an empty root node, first-level nodes for the unique items in the dataset and nodes for all the frequent itemsets in a canonical order. The key of a tree node is either an item or a frequent itemset. After the tree is fully built, we can simply retrieve the frequent itemsets by traversing the tree and filtering out the infrequent first-level nodes. Freno keeps an accurate count of the infrequent items and itemsets so as to grow the tree on incrementally added transactions. Unlike FP-tree which links its tree nodes horizontally, Freno tree only has the parent-child link between the its nodes. As a result, Freno tree can be fully distributed.

