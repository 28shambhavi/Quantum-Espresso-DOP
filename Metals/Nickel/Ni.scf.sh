for NK in 7 8 9 10 11 12 13
do
cat > Ni.nk.${NK}.in << EOF
 &control
    calculation = 'scf',
    verbosity = 'high'
    prefix = 'Ni_exc2'
    outdir = './tmp/'
    pseudo_dir = '../pseudo/'
 /
 &system
    ibrav =  2, 
    celldm(1) = 6.659, 
    nat =  1, 
    ntyp = 1,
    ecutwfc = 40,
    occupations = 'smearing',
    smearing = 'marzari-vanderbilt',
    degauss = 0.02
 /
 &electrons
    mixing_beta = 0.7
 /

ATOMIC_SPECIES
 Ni 58.69  Ni.pbesol-spn-rrkjus_psl.1.0.0.UPF

ATOMIC_POSITIONS (alat)
 Ni 0.0 0.0 0.0

K_POINTS (automatic)
  $NK $NK $NK 1 1 1
EOF
  
 pw.x < Ni.nk.${NK}.in >  Ni.nk.${NK}.out
done 
