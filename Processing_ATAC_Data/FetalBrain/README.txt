We used make_scripts.py to make the scripts to download everything
These scripts also sort by cell type
10X_output_samples.txt was downloaded from the Github associated with the paper: https://github.com/linnarsson-lab/fetal_brain_multiomics
We needed to redo the splitting by cell type for the multiome as the naming convention is different, sort_cells_by_celltype_justATAC.py is the old version and sort_cells_by_celltype.py works with both file types

We used make_cat.py to make the scripts to bgzip, cat, and call peaks with macs2.