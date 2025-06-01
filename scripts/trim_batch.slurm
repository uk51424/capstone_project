#!/bin/bash

#SBATCH --partition=batch
#SBATCH --job-name=Trimming
#SBATCH --ntasks=1
#SBATCH --time=2:00:00
#SBATCH --mem=4gb

cd /work/binf8960/uk51424/capstone_project

module load Trimmomatic/0.39-Java-13

./scripts/trimming.sh

