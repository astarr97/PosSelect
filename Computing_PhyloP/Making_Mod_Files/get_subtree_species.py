from Bio import Phylo
import sys

tree = sys.argv[1]
subtree = sys.argv[2]

tree = Phylo.read(tree, 'newick')
subtree = tree.find_any(name=subtree)
leaves = [leaf.name for leaf in subtree.get_terminals()]
print(",".join(leaves))