#!/bin/bash

#SBATCH --job-name=MTDP
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem-per-cpu=5000
#SBATCH --no-requeue
#SBATCH --export=ALL
#SBATCH --account=PCON0421
#SBATCH --time=24:00:00

module load <Name of your GFortran 10.3 module>

export Project=MTDP

export GAMESS_LOCATION=<Your path to GAMESS here>/gamess-2021-ESPF-REKS
export WAY=$(pwd)
export InpDir=$WAY

$GAMESS_LOCATION/rungms-dev $InpDir/$Project.inp 01 12 12 > $InpDir/$Project.out
