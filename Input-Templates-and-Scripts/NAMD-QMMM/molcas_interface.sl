#!/bin/bash

#SBATCH --job-name=<Name of your model>
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem-per-cpu=5000
#SBATCH --no-requeue
#SBATCH --export=ALL
#SBATCH --account=PCON0421
#SBATCH --time=160:00:00

module load intel<Your module name>
module load python<Your module name>

export Project=<Name of your model>
export NATOMS=<Number of atoms in flexible part of the model>
export NTOTAL=<Total number of atoms in the entire model>

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
