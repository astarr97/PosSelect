#Instructions are here: http://compgen.cshl.edu/phast/gettingstarted.php

wget http://www.netlib.org/clapack/clapack.tgz
tar -xvzf clapack.tgz
cd CLAPACK-3.2.1
cp make.inc.example make.inc && make f2clib && make blaslib && make lib
cd ..
tar -xvzf phast*.tgz
#May be necessary to change the path to CLAPACK-3.2.1
make CLAPACKPATH=/scratch/users/astarr97/PhyloP/CLAPACK-3.2.1

#To install Cactus, we downloaded the precompiled binaries for version 2.6.13 from here: https://github.com/ComparativeGenomicsToolkit/cactus/releases
#We then untarred it in the PhyloP directory
#To install repeat masker verion 4.1.6, we downloaded it from here: https://www.repeatmasker.org/RepeatMasker/
#We installed it according to the instructions on the same webpage
#We used hmmer-3.4 as the search tool
#We used Dfam 3.8 as our database
#We install TRF from their github
#Install TRF, followed instructions on their github: https://github.com/Benson-Genomics-Lab/TRF
git clone https://github.com/Benson-Genomics-Lab/TRF.git
#We downloaded these through the configure step of installing RepeatMasker
#We installed MAFtools from here: https://github.com/dentearl/mafTools/, changed into the directory and ran make
