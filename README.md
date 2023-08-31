# Interface between OpenMolcas and GAMESS-US/Tinker

This interface is created to link OpenMolcas and the GAMESS-US/Tinker software packages and enable the state-interaction state-averaged REKS (SI-SA-REKS or, for short, SSR) nonadiabatic molecular dynamics (NAMD) simulations. More specifically, the interface exploits the availability of the SSR energy and analytical gradient in GAMESS-US. Thus, by combining the molecular dynamics and surface hopping (Dynamix and Surfacehop modules, respectively) functionality of OpenMolcas with QM/MM energy and gradient calculations from GAMESS-US/Tinker, we enabled the NAMD simulations using SSR level for the quantum mechanical treatment of photoresponsive molecular systems.

The scripts shared in this repository are specifically designed for parsing SSR(2,2) calculations, which was shown to be performing well in our test calculations. To read about the differences between SSR(3,2) and SSR(2,2) refer to this paper:

- Filatov, M.; Lee, S.; Choi, C. H. "Description of Sudden Polarization in the Excited Electronic States with an Ensemble Density Functional Theory Method." _J. Chem. Theory Comput._ **2021**, _17_, 5123–5139. [doi.org/10.1021/acs.jctc.1c00479](https://doi.org/10.1021/acs.jctc.1c00479)

For detailed overview of the REKS method see the paper below:

- Filatov, M. "Spin-Restricted Ensemble-Referenced Kohn-Sham Method: Basic Principles and Application to Strongly Correlated Ground and Excited States of Molecules." _Wiley Interdiscip. Rev. Comput. Mol. Sci._ **2015**, _5_, 146–167. [doi.org/10.1002/wcms.1209](https://doi.org/10.1002/wcms.1209)

For published example of interface implementation see the paper below:

- Filatov(Gulak), M.; Paolino, M.; Pierron, R.; Cappelli, A.; Giorgi, G.; Léonard, J.; Huix-rotllant, M.; Ferré, N.; Yang, X.; Kaliakin, D.; Blanco-González, A.; Olivucci, M. "Towards the Engineering of a Photon-Only Two-Stroke Rotary Molecular Motor." Nat. Commun. **2022**, _13_, 6433. [doi.org/10.1038/s41467-022-33695-x](https://doi.org/10.1038/s41467-022-33695-x)

# Requirements
The interface was developed and tested using OpenMolcas without HDF5 library compiled with Intel Fortran, version 2021.3.0 and GAMESS-US compiled with GFortran, version 10.3. The older compilers do not support functionalities that were introduced in modified version of GAMESS-US distributed with this interface. In both cases the MKL libraries were used. We also would like to mention that we have only tested our interface on Linux64 computational clusters using Slurm Workload Manager. We recommend using 6 CPUs per trajectory when target of calculations is smaller system and the computational resources are limited, while 12 CPUs per trajectory is better choice for more computationally demanding systems. The SSR(2,2) method has a good scalability and potentially higher numbers of CPUs per trajectory could be used. However, we encourage you to perform the scalability tests for your system of interest to elucidate the optimal number of CPUs for your particular model.

## Installation
Installation requires download of standard versions of OpenMolcas and GAMESS-US and then substitution of the source files by the ones provided in the [GitLab repository](https://gitlab.com/interface-between/openmolcas-and-gamess-us-with-tinker). Please refer to the [Wiki pages](https://gitlab.com/interface-between/openmolcas-and-gamess-us-with-tinker/-/wikis/home) for the detailed step-by-step installation of the interface.

## QM/MM and Gas Phase Functionality

The modifications to OpenMolcas and GAMESS-US allow for utilization of the interface both in QM/MM solvent calculations and QM-only gas phase simulations. Two functionalities are achieved with modifications in "GUTS" (folder containing parsing Shell scripts) and "molcas_interface.sl" (the submission script). In addition, the structure of GAMESS-US input files differs for two types of calculations. Please refer to provided templates with explanation of the differences in QM/MM and gas phase runs with the interface. The detailed description of the templates and the steps needed for preparation of the input used in the NAMD simulations with the interface are described in [Wiki pages](https://gitlab.com/interface-between/openmolcas-and-gamess-us-with-tinker/-/wikis/home).

We provide two examples that allow to test both QM/MM and gas phase NAMD functionalities. Upon building the interface we recomend first using the [PSB3-CH3 gas phase test](https://gitlab.com/interface-between/openmolcas-and-gamess-us-with-tinker/-/tree/main/Examples/PSB-CH3-NAMD), which allows for quicker test of your modified OpenMolcas and GAMESS builds. To test full QM/MM functionality please use the [MTDP in methanol test](https://gitlab.com/interface-between/openmolcas-and-gamess-us-with-tinker/-/tree/main/Examples/MTDP-NAMD).

**Important**: provided test examples contain keyword "FRANDOM" in Surfacehop part of OpenMolcas input. This keyword is present only to allow you to reproduce exact data in our examples. Please remember to remove this command when performing actual production run with your sampling.

The procedure that we use for generation of SSR(2,2) QM/MM initial conditions in our sampling involves initial equilibration of model system in ground state using KS DFT. We also include the example of such calculations [here](https://gitlab.com/interface-between/openmolcas-and-gamess-us-with-tinker/-/tree/main/Examples/ground-state-MD-MTDP)

## Help
If you need further assistance in installation of the interface and/or initiation of your calculations please contact research group of Prof. Massimo Olivucci at Bowling Green State University.
