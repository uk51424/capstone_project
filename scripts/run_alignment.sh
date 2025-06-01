#!/bin/bash

REF="data/genomes/ecoli_rel606.fna"

# Loop for all forward paired-end reads 
for fwd in data/trimmed_fastq/*_1.paired.fastq.gz
do
    # Get the sample name without the _1.paired.fastq.gz
    sample=$(basename "$fwd" _1.paired.fastq.gz)

    # define reverse read filename using the sample name
    rev="data/trimmed_fastq/${sample}_2.paired.fastq.gz"

    # define the output SAM file location
    out="results/sam/${sample}.sam"

    echo "Aligning $sample ..."
    bwa mem $REF $fwd $rev > $out
done

echo " All reads aligned!"

