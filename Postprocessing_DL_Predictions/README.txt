This was used to postprocess the ChromBPNet predictions.

First, we used the commands in commands_pull_variants.sh to reorganize the deep learning predicitions for each cell type.
This uses pull_variants.py

Next, we needed to compute our cell type-specificity metrics.  To do this, we used the commands in join_all.sh
We first sorted the files and then normalized the predictions using normalize.py as described in the Methods.
We then pasted each group of cell types together and eliminated extraneous information with an awk command.
We repeated this swapping Adult L2/3 cortical neurons and fetal cortical exctitatory neurons for the increasing cell type-specifcity analysis
We also repeated it using the other 4 neuronal cell types included in the cell type-specificity analysis

We then used the compute_taus*.py scripts to compute cell type-specificity metrics as described in the Methods.  All the scripts are very similar.
We modified the scripts with different out/in file names (hardcoded) for removing 1 or 2 cell types for the stratifying by cell type-specificity part of things.
