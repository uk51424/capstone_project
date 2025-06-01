# Trimmomatic
module load Trimmomatic/0.39-Java-13

# path to trimmomatic file
TRIMMOMATIC="java -jar /apps/eb/Trimmomatic/0.39-Java-13/trimmomatic-0.39.jar"

# looping

for sample in SRR2584863 SRR2584866 SRR2589044
do
  echo "Trimming $sample..."

  $TRIMMOMATIC PE \
    data/raw_fastq/${sample}_1.fastq.gz data/raw_fastq/${sample}_2.fastq.gz \
    data/trimmed_fastq/${sample}_1.paired.fastq.gz data/trimmed_fastq/${sample}_1.unpaired.fastq.gz \
    data/trimmed_fastq/${sample}_2.paired.fastq.gz data/trimmed_fastq/${sample}_2.unpaired.fastq.gz \
    ILLUMINACLIP:data/raw_fastq/NexteraPE-PE.fa:2:30:10:5:TRUE \
    SLIDINGWINDOW:4:20 MINLEN:25
done
