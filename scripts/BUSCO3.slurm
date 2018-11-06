#!/bin/sh
#SBATCH --job-name=busco
#SBATCH --account=nn9404k
#SBATCH --output=slurm-%j.base
#SBATCH --time=165:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=15
#SBATCH --mem-per-cpu=4G
#SBATCH --partition=normal

module purge

module load python2/2.7.10 # should be loaded by busco3, but is not at the moment.
module load busco/v3.0.1

# Modules loaded by busco
# module load python3/3.2.3
# module load blast+/2.6.0
# module load augustus/3.2.2
# module load hmmer/3.1b2

#First: make a folder called augustus. Move to this folder and run:
#cp -r /cluster/software/VERSIONS/augustus/3.2.2/config .
export AUGUSTUS_CONFIG_PATH="/work/users/username/yourchosenpath/augustus/config" #change username

run_BUSCO.py -i genome_assembly.fasta -o busco -l bacteria_odb9 -m geno
