Following are the commands for the band structure calculation:


Command for running the scf calculation:
    pw.x < gr_scf.in > gr_scf.out


Find out the final value of fermi energy from the output file gr_scf.out. We can easily do this by using the grep command. Eg: grep string1 filename1     this will give us an echo for every occurence of string1 in filename1.


Command for running the non scf calculation:
    pw.x < gr_bands.in > gr_bands.out


Command for band calculation:
    bands.x < bandplots.in > bandplots.out


Plotting the band:
    plotband.x <plotband.in > plotband.out
