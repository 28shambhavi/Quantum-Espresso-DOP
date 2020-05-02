for NK in 6 8 12 16
do
cat > Cu.nk.${NK}.in << EOF
 &control
    calculation = 'scf',
    verbosity = 'high'
    prefix = 'Cu_exc2'
    outdir = './tmp/'
    pseudo_dir = '../pseudo/'
 /
 &system
    ibrav =  2, 
    celldm(1) = 6.8311, 
    nat =  1, 
    ntyp = 1,
    ecutwfc = 30,
    occupations = 'smearing',
    smearing = 'marzari-vanderbilt',
    degauss = 0.02
 /
 &electrons
    mixing_beta = 0.7
 /

ATOMIC_SPECIES
 Cu 63.54  Cu.pz-d-rrkjus.UPF

ATOMIC_POSITIONS (alat)
 Cu 0.0 0.0 0.0

K_POINTS (automatic)
  $NK $NK $NK 1 1 1
EOF
  
 pw.x < Cu.nk.${NK}.in >  Cu.nk.${NK}.out
done 
