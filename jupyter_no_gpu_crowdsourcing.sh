#!/bin/bash -l

#SBATCH --job-name=ops-jupyter
#SBATCH --partition=cpu
#SBATCH --ntasks=1
#SBATCH --time=2-00:00
#SBATCH --mem=256G
#SBATCH --signal=USR2
#SBATCH --cpus-per-task=1

echo "start"
date
module load anaconda3/2021.05-gcc-9.4.0

eval "$(conda shell.bash hook)"

conda activate /scratch/prj/cb_lymphnode/Mengyuan/crowdsourcing/ENV

# python -m histoqc -c v2.1 -n 3 "sample/TCGA-A1-A0SF-01Z-00-DX1.7F252D89-EA78-419F-A969-1B7313D77499.svs"
#python -m histoqc -c ML -n 3 "/scratch/users/k20028367/HistoQC/temp/*.ndpi"
python -m histoqc -c histoqc/config/config.ini -n 3 "sample/TCGA-A1-A0SF-01Z-00-DX1.7F252D89-EA78-419F-A969-1B7313D77499.svs"


