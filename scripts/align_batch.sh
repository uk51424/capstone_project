
#!/bin/bash

#  alignment

# reference genome file
REFERNCE="data/genomes/ecoli_rel606.fna"

# Folder where trimmed fastq files are stored
READS_DIR="data/trimmed_fastq"

# Folder to save output SAM files
OUTPUT_DIR="results/sam"

# Loop through all forward reads (files ending in _1.paired.fastq.gz)
for FORWARD in ${READS_DIR}/*_1.paired.fastq.gz
do
    # Extract the sample name 
    SAMPLE=$(basename $FORWARD _1.paired.fastq.gz)

    # Define reverse read
    REVERSE="${READS_DIR}/${SAMPLE}_2.paired.fastq.gz"

    # Output SAM file path
    OUTPUT="${OUTPUT_DIR}/${SAMPLE}.sam"

    # Print message
    echo "Aligning $SAMPLE ..."

    # Run BWA MEM to align reads
    bwa mem $REFERENCE $FORWARD $REVERSE > $OUTPUT
done


