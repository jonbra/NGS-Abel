#!/bin/bash

# Job name:
#SBATCH --job-name=kallisto
#
# Project:
#SBATCH --account=nn9404k
#
# Wall clock limit (max run time allocated):
#SBATCH --time=12:00:00
#
# Max memory usage (size in megabytes (M) or gigabytes (G)):
#SBATCH --mem-per-cpu=32G

## Set up job environment:
source /cluster/bin/jobsetup
module purge   # clear any inherited modules
set -o errexit # exit on errors

## Load necessary modules/programs (run module avail to see available modules):
module load Anaconda3
source activate kallisto-env

cat SRR_list.txt | xargs -n 1 bash kallisto.sh
