#!/bin/bash
#SBATCH --partition=batch            
#SBATCH --job-name=AlignReads        
#SBATCH --ntasks=1                   
#SBATCH --time=4:00:00               
#SBATCH --mem=4G                     

# project folder
  cd /work/binf8960/uk51424/capstone_project

# Load the BWA module
module load  bwa-meth/0.2.6-GCC-11.2.0

# alignment script
bash scripts/run_alignment.sh

