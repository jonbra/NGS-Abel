### Preprocessing

```
#!/bin/sh
#SBATCH --job-name=sgapre
#SBATCH --account=nn9404k
#SBATCH --output=%j.base
#SBATCH --time=5:00:00
#SBATCH --mem-per-cpu=24G

source /cluster/bin/jobsetup
module purge
set -o errexit

module purge
module load sga/0.10.13

sga preprocess --pe-mode 1 *R1_001.fastq *R2_001.fastq > sga_processing.fastq
```

### Indexing

```
#!/bin/sh
#SBATCH --job-name=sgaind
#SBATCH --account=nn9404k
#SBATCH --output=%j.base
#SBATCH --time=5:00:00
#SBATCH --mem-per-cpu=50G

source /cluster/bin/jobsetup
module purge
set -o errexit

module purge
module load sga/0.10.13

sga index -a ropebwt --no-reverse -t 8 sga_processing.fastq
```
