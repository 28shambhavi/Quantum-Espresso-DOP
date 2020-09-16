# Quantum-Espresso-DOP

## Calculations done under Design Oreinted Project using Quantum Espresso

### Silicon and Metals (Al, Cu, Ni, Ag, Fe)
Calculation of scf, convergence test using plane-wave cutoff, bandstructure graph

### Single-layer Graphene
scf, non-scf, bandstructure

### Bi-layer graphene
scf, non-scf, bandstructure for both aa and ab type, as well as a case of sliding two AA bilayers above one another. DOS graphs for the bilayer have also been computed. 

--------------------------------------------------------
# A Brief intro to Quantum Espresso and the methods used in this study:
Each of the input parameters have meanings that need to be considered. It is important to understand these as they decide if a particular computation goes write or wrong.

Any of the sections that have an ampersand are described in the literature as ”cards” and the rest are simple parameter specifications. 

## Features of Input File:

### CONTROL

The important parameter that it describes are: 

Calculation, which determines the type of calculation, as in scf, nscf, band etc.

Restart mode = 0 from scratch0 this field tells the program to restart the calculations from scratch if there is a problem. 

outdir: temporary directory for large files. Must be writable, will be created if not existent. outdir=’../tmp’ should be fine.

pseudo dir: directory where pseudopotential (PP) files are kept. It must exist, be readable, and contain the required PP file (in this example, Si.pz-vbc.UPF for Silicon). 

pseudo dir=’../pseudo’ should be fine



### SYSTEM
describes the structure of the system under calculation. 
The field **ibrav = 4** tells the type of bravais lattice to use for the calculation, example, 4 stands for the hexagonal lattice. 
The field **celldm(1)** and **celldm(3)** give the lattice parameters for a, b and c respectively. 
The parameter **c** is only included as the program requires it; it will be given a very large value to separate the layers and provide separation. 
**nat = 2** gives the number of atoms in the unit cell. T
**ntyp = 1** tells the system how many types of atoms there are in the unit cell. 
**ecutwfc = 30** gives the energy cutoff for the wavefunction calculations in units of Rydberg. The **cutoff energy** for the wavefunction tells how much energy can be used for the  dispersion relation of the plane-waves used to determine structure of the system. 
**occupations** tells the system to use the specified method
**smearing** tells the system the type of distribution to use when smearing. 

### ELECTRONS

card has only two key fields. 

Conv thr = 1.D − 7 which gives the value for the convergence threshold of the energy of the final wavefunctions. The calculations will finish when the value of the self consistent calculation gives an energy difference less than the threshold. 

The field mixing beta = 0.3D0 tells the system that when it gets results to feed them back into the calculations with a percent equal to the mixing beta parameter. 


### ATOMIC SPECIES
gives the information to be used by the machine for the atoms in the system. We specify the atomic weight, the name of the pseudopotential file to be used. 


### K POINTS
give various ways to determine the number of K points and path used for various calculations like the band structure. All fields have been explained, except for the ones inside the **ATOMIC POSITIONS** parameter. It is in units of lattice parameters (alat). We specify the positions of the atoms as required by the case.  

---------------------------
### DOS Calculation: 
This calculation provides us with the Density of States for a given set of K points. 

**DOS plot**: DOS vs E-E(f) in eV

Shown in the figure above is the DOS calculation for Single Layer Graphene. The ones with negative energy represent the HOLES and the ones with positive energy represent the ELECTRONS.
To increase the accuracy of the calculation the number of empty bands and the mesh of k-points must be increased. For example, by setting nbnd=16, the mesh of k-points to 48 48 1 for scf calculation and 96 96 1 for nscf calculation, we get a more accurate DOS as in the figure below (we set degauss=0.02 in the projwfc input). Executed by projwfc.x library.

----------------------------
### Band Structure Calculation:
We perform again a non self-consistent calculation (nscf) where k-point mesh is substituted with paths along the lines connecting the high symmetry points in the Brillouin zone.

**K_POINTS crystal_b**

4

-0.333333333 0.666666667 0.000000000 50 ! K

0.0000000000 0.000000000 0.000000000 50 ! G

0.000000000 0.500000000 0.000000000 50 ! M 

-0.333333333 0.666666667 0.000000000 50 ! K

The code above shows how we describe a K-path for the nscf calculation in band structure calculation


To do it. we need to run pw.x with another input file, which will be called "graphene.band.in". The file looks similar to "graphene.scf.in" that we have used previously. The main difference is that the 'band' is used for the parameter "calculation". The number of band to be drawn is set to be 16 (nbnd=16). Here, K_POINTS is given differently. The points are specified in unit of 2π/a, where a is equal to the one given in celldm(1). Note that the points are described in cartesian coordinates.


Those points are connected by straight line and the band is calculated along the line. The integer given in the fourth column indicates that each line is divided by 50 mesh points and at those  points the band is calculated.

---------------------------------
### Plotting: 
Graphs have been plotted using xmgrace software. To attain the upspin and downspin both in the same graph, we plotted one with the transformation y=-y. Similarly to achieve a graph of E-E(f), we have done the transformation on all the data sets.

--------------------------------------
### Xcrysden view of sample:
Use Xcrysden to view the structure in the sample file:
**$ xcrysden --pwi Al.sample.in **

---------------------------------------
### Convergence tests with respect to plane-wave cut-off:
To find out how the total energy changes when we vary the plane wave cut-off ecutwfc. we can either do this by copying the sample file Si.sample.in to other input files and editing them, and running pw.x using each of these input files in turn, or by running the sample shell script Si.sample.sh. We can easily find the values of the total energy by searching for an exclamation mark, e.g., using the grep command.  Plot the data.

-------------------------------------------------------
### Convergence with respect to Brillouin zone sampling:
Fix the value of ecutwfc convergence value. Differences in energy matters rather than the absolute value of the total energy, hence an approxiamte value will also work perfectly.

Let the lattice constant celldm(1) remain at the experimental value. Vary the Monkhorst-Pack grid parameters nk1, nk2 and nk3. We can do this either by manually editing input files, or by creating a shell script. Use nk1=nk2=nk3= 1, 2, 3, 4, 5, 6.		Leave the offset at k1=k2=k3 = 1.
Run pw.x (with correct path) for each of the input files and plot the data.

-----------------------------------------------
### Equilibrium lattice constant of Si:
Fix values of ecutwfc and nk1=nk2=nk3. I chose ecutwfc and nk1=nk2=nk3=6, but you can choose other values if you feel that they are more appropriate. Make input files in which you vary the lattice constant, i.e., celldm(1), in steps. Then run the scf calculations.
By plotting the Total energy in Ry VS Lattice const in Bohr , We can observe that the energy is symmetric about the minimum value. This minimum value corresponds to the equilibrium lattice constant
