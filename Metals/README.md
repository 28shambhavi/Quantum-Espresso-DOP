For the metals Copper, Iron, Silver and Nickel the following calculations have been run:
In all three of them, scf calculation is conducted using pw.x to launch the input file. The input files differ slightly as explained below:

### 1. Convergence Test

We keep everything fixed and only change the value of ecut to the various experimental value. In the Total Energy VS Ecut graph, the value of Total Energy converges along the and one can find the Wave function cut off value for each metal.

### 2. Brillioun Zone Sampling

The Total Energy graph is plotted VS the number of k points or nk1=nk2=nk3=? at the various experimental values. Hence, we're able to map the graph of Total Energy as we go from 1 to 6 along the x axis as value for nk1.

### 3. Determination of Lattice Constant

Now we keep everything a contant except the celldm(1) (in Bohrs) and define it at the various experimental values. The minima in the Total Energy VS Lattice Constant graph helps us determine the celldm(1) variable at the most stable value.

Output files have been provided for every calculation for reference along with the input files. Most of these calculations can be run with a shell scrpit and the script has been attached along with it. 


For magnetic materials such as iron: nspin=2 and starting magnetization = 1 has been added to the Input file to include the effect of magnestism and spin.
