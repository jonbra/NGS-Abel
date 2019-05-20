#!/bin/bash
module purge
module load trim-galore
module load fastqc
for f1 in *_1.fastq.gz
do
        f=${f1%%_1.fastq.gz}
        f2=${f1%%_1.fastq.gz}"_2.fastq.gz"

        #set a prefix to make understanding what has been done to the file easier
        PREFIX=trimmed_
        PREFIX_SE=SE_

        #create the new file name (e.g. trimmedgly7a.fq.gz)
        NEWTRIMFILE_R1=${PREFIX}$f1
        NEWTRIMFILE_R2=${PREFIX}$f2
        SE_TRIMFILE_R1=${PREFIX_SE}$f1
        SE_TRIMFILE_R2=${PREFIX_SE}$f2
mkdir trimgalore_out_"$f"
trim_galore -length 1 -e 0 -q 0 --paired $f1 $f2 -o trimgalore_out_"$f"
cd trimgalore_out_"$f"

t1=${f1%%_1.fastq.gz}"_trimgalore_1.fastq.gz"
t2=${f2%%_2.fastq.gz}"_trimgalore_2.fastq.gz"

mv ${f1%%_1.fastq.gz}"_1_val_1.fq.gz" $t1
mv ${f2%%_2.fastq.gz}"_2_val_2.fq.gz" $t2


        #do the trimming
        java -jar /usit/abel/u1/inajan/Trimmomatic-0.35/trimmomatic-0.35.jar PE -phred33 -threads 8 $t1 $t2 $NEWTRIMFILE_R1 $SE_TRIMFILE_R1 $NEWTRIMFILE_R2 $SE_TRIMFILE_R2 ILLUMINACLIP:/usit/abel/u1/inajan/Trimmomatic-0.35/adapters/TruSeq3-PE-3.fa:2:20:7 LEADING:20 TRAILING:20 SLIDINGWINDOW:4:20 MINLEN:20

cd ..
mkdir fastqc
fastqc trimgalore_out_"$f"/*.gz -t 8 -o fastqc

mv trimgalore_out_"$f"/$NEWTRIMFILE_R1 .
mv trimgalore_out_"$f"/$NEWTRIMFILE_R2 .
mv trimgalore_out_"$f"/$SE_TRIMFILE_R1 .
mv trimgalore_out_"$f"/$SE_TRIMFILE_R2 .

done


