#!/bin/sh
####################################################
# This is a sample script to run scf total-energy
# calculations on a unit cell of Al using 
# different values for the Monkhorst-Pack grid divisions
# an different values of smearing parameter degauss
#
#
# You should copy this file and modify it as 
# appropriate for the tutorial.
####################################################
# Notes:
#
# 1. You can loop over a variable by using the 
#    'for...do...done' construction. 
# 2. Variables can be referred to within the script 
#    by typing the variable name preceded by the '$' 
#    sign. 
#
####################################################
# Important initial variables for the code
# (change these as necessary)
####################################################

NAME1='alat'

####################################################

for celldm in 1 1.5 2
do
cat > Ag.$NAME1.${celldm}.in << EOF
 &control
    calculation = 'scf',
    prefix = 'Ag_exc2'
    outdir = './tmp/'
    pseudo_dir = '../pseudo/'
 /
 &system
    ibrav =  3, 
    celldm(1) = $celldm, 
    nat =  1, 
    ntyp = 1,
    ecutwfc =30 ,
    occupations = 'smearing',
    smearing = 'marzari-vanderbilt',
    degauss = 0.02
 /
 &electrons
    mixing_beta = 0.7
 /

ATOMIC_SPECIES
 Ag 107.86  Ag.pbe-n-rrkjus_psl.1.0.0.UPF

ATOMIC_POSITIONS (alat)
 Ag 0.0 0.0 0.0
K_POINTS (automatic)
  6 6 6 1 1 1
EOF

pw.x < Ag.$NAME1.${celldm}.in >  Ag.$NAME1.${celldm}.2.out

done
