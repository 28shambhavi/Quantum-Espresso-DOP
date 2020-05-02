for NK in 6 8 12 16
do
cat > Fe.nk.${NK}.in << EOF
 &control
    calculation = 'scf',
    verbosity = 'high'
    prefix = 'Fe_exc2'
    outdir = './tmp/'
    pseudo_dir = '../pseudo/'
 /
 &system
    ibrav =  2, 
    celldm(1) = 5.4168, 
    nat =  1, 
    ntyp = 1,
    ecutwfc = 37,
    occupations = 'smearing',
    smearing = 'marzari-vanderbilt',
    degauss = 0.02
 /
 &electrons
    mixing_beta = 0.7
 /

ATOMIC_SPECIES
 Fe 55.845  Fe.pbesol-spn-rrkjus_psl.1.0.0.UPF

ATOMIC_POSITIONS (alat)
 Fe 0.0 0.0 0.0

K_POINTS (automatic)
  $NK $NK $NK 1 1 1
EOF
  
 pw.x < Fe.nk.${NK}.in >  Fe.nk.${NK}.out
 
done
