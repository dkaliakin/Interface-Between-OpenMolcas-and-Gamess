#!/bin/bash

#SBATCH --job-name=PSB3-CH3
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --mem-per-cpu=5000
#SBATCH --no-requeue
#SBATCH --export=ALL
#SBATCH --account=PCON0421
#SBATCH --time=48:00:00

module load intel<Name of your module>
module load python<Name of your module>

export Project=PSB3-CH3

export PATH=$PATH:<Here you have to specify your own path>/OpenMolcas/build

export WorkDir=/tmp/$SLURM_JOB_ID
export WAY=$(pwd)
export MOLCAS_MEM=4500

export InpDir=$WAY
export MOLCAS_OUTPUT=$WAY

mkdir -p $WorkDir
cd $WorkDir
<Here you have to specify your own path>/OpenMolcas/build/pymolcas $InpDir/$Project.input > $InpDir/$Project.out 2> $InpDir/$Project.err 
cp $WorkDir/$Project.JobIph $InpDir/$Project.JobIph
rm -rf $WorkDir

