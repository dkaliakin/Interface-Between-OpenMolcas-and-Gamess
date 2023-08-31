#!/bin/bash

#SBATCH --job-name=<Name of your model>
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=5000
#SBATCH --no-requeue
#SBATCH --export=ALL
#SBATCH --account=PCON0421
#SBATCH --time=48:00:00

module load intel<Name of your module here>
module load python<Name of your module here>

export Project=<Name of your model>

export PATH=$PATH:<Path to your OpenMolcas build here>/OpenMolcas/build
export TINKER=<Path to your Tinker executables>/OpenMolcas/tinker/bin

export WorkDir=/tmp/$SLURM_JOB_ID
export WAY=$(pwd)
export MOLCAS_MEM=4500

export InpDir=$WAY
export MOLCAS_OUTPUT=$WAY

mkdir -p $WorkDir
cd $WorkDir
<Path to your OpenMolcas build here>/OpenMolcas/build/pymolcas $InpDir/$Project.input > $InpDir/$Project.out 2> $InpDir/$Project.err 
cp $WorkDir/*.JobIph $InpDir/MTDP.JobIph
rm -rf $WorkDir

