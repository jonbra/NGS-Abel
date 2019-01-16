#!/bin/sh
#SBATCH --job-name=hmmer
#SBATCH --account=uio
#SBATCH --output=hmmer-%j.base
##SBATCH --partition=hugemem
#SBATCH --time=100:00:00
##SBATCH --ntasks=4
#SBATCH --mem-per-cpu=16G

source /cluster/bin/jobsetup
module purge   # clear any inherited modules
set -o errexit # exit on errors

module load hmmer/3.0

hmmscan --cpu 8 --domtblout TrinotatePFAM.out /work/databases/bio/trinotate/Pfam-A.hmm ../trinity/Trinity.longest.isoform.cut.fasta.transdecoder_dir/longest_orfs.pep > pfam.log

