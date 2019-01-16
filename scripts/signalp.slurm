#!/bin/sh
#SBATCH --job-name=signalP
#SBATCH --account=uio
#SBATCH --output=signalP-%j.base
##SBATCH --partition=hugemem
#SBATCH --time=100:00:00
##SBATCH --ntasks=4
#SBATCH --mem-per-cpu=16G

source /cluster/bin/jobsetup
module purge   # clear any inherited modules
set -o errexit # exit on errors

# Needs to have a user installation of signalp
perl ~/signalp-4.1/signalp -f short -n signalp.out ../trinity/Trinity.longest.isoform.cut.fasta.transdecoder_dir/longest_orfs.pep
