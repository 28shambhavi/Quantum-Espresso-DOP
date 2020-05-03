SETTING UP THE INPUT FILE for SINGLE LAYER: In the scf file, K_POINTS automatic: 24 24 1 0 0 0, are advisable as the minimum number if K points. One can take 12 12 1 0 0 0 also but the graphs obtained do not do justice to the calculation. The greater the K point mesh, the more accurate the calculations become. Especially in the case of DOS calculations.


Magnetic Properties displayed by agraphene can be tested by including these parameters under the &SYSTEM card
nspin=2,
nbnd = 16,
starting_magnetization(1)=0.5


ATOMIC_POSITIONS angstrom
C 0.000000000 0.000000000 5.000000000
C 0.000000000 1.424500000 5.000000000



SETTING UP THE INPUT FILE for BILAYER: The rule for K points remains valid here as well. 
An example of the Atmic positions for AA Bilayer has been given below:

ATOMIC_POSITIONS angstrom
C 0.000000000 0.000000000 5.000000000
C 0.000000000 1.424500000 5.000000000
C 0.000000000 0.000000000 8.520000000
C 0.000000000 1.424500000 8.520000000

Now, instead of just two carbon atoms we specify the atomic positions for 4 of them.



BAND STRUCTURE CALCULATION:
Command for running the scf calculation:        pw.x < gr_scf.in > gr_scf.out


Find out the final value of fermi energy from the output file gr_scf.out. We can easily do this by using the grep command. Eg: grep string1 filename1             this will give us an echo for every occurence of string1 in filename1.


Command for running the band calculation:       pw.x < gr_bands.in > gr_bands.out


Command for bandplot computation:               bands.x < bandplots.in > bandplots.out


Plotting the band:                              plotband.x <plotband.in > plotband.out
    


DOS CALCULATION:
Firstly, run an scf calculation just like in the above calculation. Then, for doing nscf calculation we use the pw.x library to launch. The only change in the input file that occurs here is the change of parameters: calculation='nscf' and occupations = 'tetrahedra' 

pw.x<gr.nscf.in>g_nscf.out

For calculation of DOS we use the projwfc.x library to launch the input file.           

projwfc.x<g_dos.in>gr.dos.out


Now we take the values from the output file: "graphene.pbe.pdos.pdos_tot" and plot in a suitable graph plotting software. Eg: Xmgrace
