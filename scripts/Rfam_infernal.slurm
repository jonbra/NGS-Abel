# First run:
# wget ftp://ftp.ebi.ac.uk/pub/databases/Rfam/CURRENT/Rfam.cm.gz
# gunzip Rfam.cm.gz
# module load infernal/1.1
# cmpress Rfam.cm

# Slurm script:

#!/bin/bash
#SBATCH --job-name=Rfam
#SBATCH --account=NN9404K
#SBATCH --output=slurm-%j.base
#SBATCH --time=12:00:00
#SBATCH --partition=normal
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=2000M

## Set up job environment:
source /cluster/bin/jobsetup
module purge
set -o errexit
module load infernal/1.1
module load perlmodules

cmscan --cut_ga --rfam --nohmmonly --tblout infernal.tblout Rfam.cm miRNA_precursors.fasta > infernal.cmscan
