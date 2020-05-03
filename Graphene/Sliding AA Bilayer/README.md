For six value of sliding distance (in angstrom), we have computed the DOS  Plots using a varying mesh of K points. 

PREPARATION OF INPUT FILES: The following are the atomic positions for the atomic positions of the two layer of Graphene at sliding distance =1.4 Angstrom.

ATOMIC_POSITIONS angstrom

C 0.000000000 0.000000000 5.000000000

C 0.000000000 1.424500000 5.000000000

C 1.400000000 0.000000000 8.300000000

C 1.400000000 1.424500000 8.300000000

Here the x coordinates of the 3rd and 4th carbon denote displacement in the required direction. And the change in interlayer distance is reflected in the z coordinates of the 3rd and 4th carbon wrt the 1st and 2nd carbon. According to a recently published paper we know:

Sliding Distance (in A) ; Interlayer Distance (in A) 

0.4 ; 3.48 ; 

0.6 ; 3.42 ;

1 ; 3.3 ; 

1.4 ; 3.3 ;

1.8 ; 3.38 ; 

2.4 ; 3.5 ;

These are followed in setting up the INPUT FILES for the computation.


--------------------------------------------------------------------

STEPS:

1. scf calculation: Here, as explained before, the variables calculation='scf' and occupations = 'smearing':

$ pw.x<gr.scf.in>gr.scf.out

2. non-scf calculation: The only change in the input file that occurs here is the change of parameters: calculation='nscf' and occupations = 'tetrahedra' :

$ pw.x<gr.nscf.in>gr.nscf.out

3. DOS plot calculation:

$ projwfc.x<gr.dos.in>gr.dos.out

4. Plotting of data: Where dosdata.dat is the file containing the data in "graphene.pbe.pdos.pdos_tot" file. Through this data one can plot the upspin and downspin by importing specific coloums in the plotting software.

$ xmgrace dosdata.dat
