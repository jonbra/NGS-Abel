#!/bin/bash
#SBATCH --job-name=kraken
#SBATCH --account=nn9725k
#SBATCH --output=slurm-%j.base
#SBATCH --time=10:00:00
#SBATCH --mem-per-cpu=10G
#SBATCH --cpus-per-task=16

module load Kraken2/2.0.8-beta-foss-2018b-Perl-5.28.0

#kraken2-build --standard --threads 1 --db kraken_db

kraken2 --db kraken_db --threads 4 --output out_sample10 --report report_sample10 --use-names --paired --gzip-compressed --classified-out test_classified_sample10#.fq --unclassified-out test_unclassified_sample10#.fq --fastq-input /cluster/home/inajan/Genome/trimmed_reads/trimmed_10_1.fastq.gz /cluster/home/inajan/Genome/trimmed_reads/trimmed_10_2.fastq.gz
