#!/bin/bash

#SBATCH --job-name=MTDP-GS-DFT
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem-per-cpu=5000
#SBATCH --no-requeue
#SBATCH --export=ALL
#SBATCH --account=<Your account>
#SBATCH --time=160:00:00

module load intel<Name of your module here>
module load python<Name of your module here>

export Project=MTDP-GS-DFT-147
export NATOMS=220
export NTOTAL=5470

export GAMESS_LOCATION=<Your path to GAMESS here>/gamess-2021-ESPF-REKS
export PATH=$PATH:<Your path to OpenMolcas here>/OpenMolcas/build

export WorkDir=/tmp/$SLURM_JOB_ID
export WAY=$(pwd)
export MOLCAS_MEM=4500

export InpDir=$WAY
export MOLCAS_OUTPUT=$WAY

cp $InpDir/$Project.G.inp $InpDir/$Project.G.tmp.inp

mkdir -p $WorkDir
cd $WorkDir
<Your path to OpenMolcas here>/OpenMolcas/build/pymolcas $InpDir/$Project.input > $InpDir/$Project.out 2> $InpDir/$Project.err 
rm -rf $WorkDir

#rm $InpDir/*.txt
