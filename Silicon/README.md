In all three of the computations, scf calculation is conducted using pw.x to launch the input file. The input files differ slightly as explained below:

Convergence Test 

We keep everything fixed and only change the value of ecut to the various experimental value. In the Total Energy VS Ecut graph, the value of Total Energy converges along the and one can find the Wave function cut off value for each metal.

----------------------------------------------------

Brillioun Zone Sampling 

The Total Energy graph is plotted VS the number of k points or nk1=nk2=nk3=? at the various experimental values. Hence, we're able to map the graph of Total Energy as we go from 1 to 6 along the x axis as value for nk1.

-------------------------------------------------------

Determination of Lattice Constant 

Now we keep everything a contant except the celldm(1) (in Bohrs) and define it at the various experimental values. The minima in the Total Energy VS Lattice Constant graph helps us determine the celldm(1) variable at the most stable value.

Output files have been provided for every calculation for reference along with the input files. Most of these calculations can be run with a shell scrpit and the script has been attached along with it as well.

Command for running the scf calculation: $ pw.x < gr_scf.in > gr_scf.out

-----------------------------------------------

Band Structure Calculation:

Command for running the scf calculation: $ pw.x < si_scf.in > si_scf.out

Find out the final value of fermi energy from the output file si_scf.out. We can easily do this by using the grep command. Eg: grep string1 filename1 this will give us an echo for every occurence of string1 in filename1.

Command for running the band calculation: $ pw.x < si_bands.in > si_bands.out

Command for bandplot computation: $ bands.x < bandplots.in > bandplots.out

Plotting the band: $ plotband.x <plotband.in > plotband.out
