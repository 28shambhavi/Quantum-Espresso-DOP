Following are the commands for the various calculations for AA bilayer. 


Command for running the scf calculation:
    pw.x < gr_scf.in > gr_scf.out


Find out the final value of fermi energy from the output file gr_scf.out


Command for running the non scf calculation:
    pw.x < gr_bands.in > gr_bands.out


Command for band calculation:
    bands.x < bandplots.in > bandplots.out


Plotting the band:
    plotband.x <plotband.in > plotband.out
