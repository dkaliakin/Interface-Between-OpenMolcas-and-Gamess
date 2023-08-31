#!/bin/bash

#SBATCH --job-name=SSR2.2-PSB3-CH3-C8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem-per-cpu=5000
#SBATCH --no-requeue
#SBATCH --export=ALL
#SBATCH --account=PCON0421
#SBATCH --time=48:00:00

module load intel/2021.3.0
module load python/3.6-conda5.2

export Project=SSR2.2-PSB3-CH3-C8-011
export NATOMS=17

export GAMESS_LOCATION=<Here you have to specify your own path>/gamess-2021-ESPF-REKS-LINK
export PATH=$PATH:<Here you have to specify your own path>/OpenMolcas/build

export WorkDir=/tmp/$SLURM_JOB_ID
export WAY=$(pwd)
export MOLCAS_MEM=4000

export InpDir=$WAY
export MOLCAS_OUTPUT=$WAY

cp $InpDir/$Project.G.inp $InpDir/$Project.G.tmp.inp

mkdir -p $WorkDir
cd $WorkDir
<Here you have to specify your own path>/pymolcas $InpDir/$Project.input > $InpDir/$Project.out 2> $InpDir/$Project.err 
rm -rf $WorkDir

#rm $InpDir/*.txt
