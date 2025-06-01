#!/bin/bash

# Reference genome
REF="data/genomes/ecoli_rel606.fna"

# Loop through each sorted BAM files
for sorted_bam in results/bam/*.sorted.bam
do
    # Get sample name from file name
    sample=$(basename "$sorted_bam" .sorted.bam)

    # Set output file paths
    bcf="results/bcf/${sample}.bcf"
    vcf="results/vcf/${sample}.vcf"

    echo "Running bcftools for $sample ..."

    # Generate pileup
    bcftools mpileup -O b -o "$bcf" -f "$REF" "$sorted_bam"

    # Call variants
    bcftools call --ploidy 1 -m -v -o "$vcf" "$bcf"
done

echo "Variant calling completed for all samples"

