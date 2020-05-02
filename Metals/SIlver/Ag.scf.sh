for NK in 6 8 12 16
do
cat > Ag.nk.${NK}.in << EOF
 &control
    calculation = 'scf',
    verbosity = 'high'
    prefix = 'Ag_exc2'
    outdir = './tmp/'
    pseudo_dir = '../pseudo/'
 /
 &system
    ibrav =  3, 
    celldm(1) = 7.7200, 
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
  $NK $NK $NK 1 1 1
EOF
  
 pw.x < Ag.nk.${NK}.in >  Ag.nk.${NK}.out  
 
 done
