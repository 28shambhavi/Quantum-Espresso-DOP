# Quantum-Espresso-DOP

## Density Function Theory Simulations using Quantum Espresso

### Silicon and Metals (Al, Cu, Ni, Ag, Fe)
Calculation of scf, convergence test using plane-wave cutoff, bandstructure graph

### Single-layer Graphene
scf, non-scf, bandstructure

### Bi-layer graphene
scf, non-scf, bandstructure for both `aa` and `ab` type, and a case of sliding two AA bilayers above one another. DOS graphs for the bilayer have also been computed. 

--------------------------------------------------------
# A Brief intro to Quantum Espresso and the methods used in this study:
Input parameters are very important! 
Any sections with an ampersand are described in the literature as `cards` and the rest are simple parameter specifications. 

## Features of Input File:

### CONTROL

The important parameters that it describes are: 

The calculation determines the type of calculation, as in SCF, NSCF, band, etc.

`Restart mode = 0` from scratch0. This field tells the program to restart the calculations from scratch if there is a problem. 

`outdir`: temporary directory for large files. It must be writable and will be created if not existent. `outdir=’../tmp’` should be fine.

`pseudo dir`: directory where pseudopotential (PP) files are kept. It must exist, be readable, and contain the required PP file (in this example, `Si.pz-vbc.UPF` for Silicon). 

`pseudo dir=’../pseudo’`



### SYSTEM
Description of the system structure for calculation: 
`ibrav = 4` tells the type of Bravais lattice to use for the calculation; for example, 4 stands for the hexagonal lattice. 
`celldm(1)` and `celldm(3)` give the lattice parameters for `a`, `b`, and `c`, respectively. 
`c` is only included if the program requires it; it will be given a huge value to separate the layers and provide separation. 
`nat = 2` gives the number of atoms in the unit cell. T
`ntyp = 1` tells the system how many types of atoms there are in the unit cell. 
`ecutwfc = 30` gives the energy cutoff for the wavefunction calculations in units of Rydberg. 
`cutoff energy` for the wavefunction tells how much energy can be used for the dispersion relation of the plane waves to determine the system's structure. 
`occupations` tells the system to use the specified method
`smearing` tells the system the type of distribution to use. 

### ELECTRONS

Card has only two key fields. 

`Conv thr = 1.D − 7`, which gives the value for the convergence threshold of the energy of the final wavefunctions. The calculations will finish when the value of the self-consistent calculation gives an energy difference less than the threshold. 

`mixing beta = 0.3D0` tells the system that when it gets results, it feeds them back into the calculations with a percent equal to the mixing beta parameter. 


### ATOMIC SPECIES
gives the information to be used by the machine for the atoms in the system. We specify the atomic weight and the name of the pseudopotential file to be used. 


### K POINTS
give various ways to determine the number of K points and paths used for various calculations, like the band structure. All fields except those inside the **ATOMIC POSITIONS** parameter have been explained. It is in units of lattice parameters (`alat`). We specify the positions of the atoms as required by the case.  

---------------------------
### DOS Calculation: 
This calculation provides the Density of States for a given set of K points. 

**DOS plot**: DOS vs E-E(f) in eV

Shown in the figure above is the DOS calculation for single-layer graphene. The ones with negative energy represent the HOLES, and the ones with positive energy represent the ELECTRONS.
To increase the accuracy of the calculation, the number of empty bands and the mesh of k-points must be increased. For example, by setting `nbnd=16`, the mesh of `k-points` to `48 48 1` for SCF calculation and `96 96 1` for NSCF calculation, we get a more accurate DOS as in the figure below (we set `degauss=0.02` in the `projwfc` input). Executed by `projwfc.x` library.

----------------------------
### Band Structure Calculation:
We perform again a Non-Self-Consistent Calculation (NSCF) where the k-point mesh is substituted with paths along the lines connecting the high symmetry points in the Brillouin zone.

**K_POINTS crystal_b**
```
4
-0.333333333 0.666666667 0.000000000 50 ! K
0.0000000000 0.000000000 0.000000000 50 ! G
0.000000000 0.500000000 0.000000000 50 ! M 
-0.333333333 0.666666667 0.000000000 50 ! K
```

The code above shows how we describe a K-path for the NSCF calculation in band structure calculation. Run `pw.x` with another input file, which will be called "graphene.band.in". The file looks similar to `graphene.scf.in` that we have used previously. The main difference is that the `band` is used for the parameter `calculation`. The number of bands to be drawn is 16 (nbnd=16). Here, `K_POINTS` is given differently. The points are specified in the `2π/a` unit, where a is equal to the one given in `celldm(1)`. Note that the points are described in cartesian coordinates.

A straight line connects those points, and the band is calculated along the line. The integer given in the fourth column indicates that each line is divided by 50 mesh points, and the band is calculated at those points.

---------------------------------
### Plotting: 
Graphs have been plotted using xmgrace software. To attain the upspin and downspin in the same graph, we plotted one with the transformation y=-y. Similarly, we have transformed all the data sets to achieve a graph of E-E(f).

--------------------------------------
### Xcrysden view of sample:
Use Xcrysden to view the structure in the sample file:
```
$ xcrysden --pwi Al.sample.in 
```
---------------------------------------
### Convergence tests with respect to plane-wave cut-off:
To determine how the total energy changes when we vary the plane wave cut-off `ecutwfc`. We can either do this by copying the sample file `Si.sample.in` to other input files and editing them, and running `pw.x` using each of these input files in turn, or by running the sample shell script Si.sample.sh. We can easily find the values of the total energy by searching for an exclamation mark, e.g., using the `grep` command.  Plot the data.

-------------------------------------------------------
### Convergence with respect to Brillouin zone sampling:
Fix the value of `ecutwfc` convergence value. Differences in energy matter rather than the absolute value of the total energy. Hence, an approximate value will also work perfectly.

Let the lattice constant `celldm(1)` remain at the experimental value. Vary the Monkhorst-Pack grid parameters nk1, nk2 and nk3. We can do this by manually editing input files or creating a shell script. Use `nk1=nk2=nk3= 1, 2, 3, 4, 5, 6`. Leave the offset at `k1=k2=k3 = 1`. Run `pw.x` (with the correct path) for each input file and plot the data.

-----------------------------------------------
### Equilibrium lattice constant of Si:
Fix values of `ecutwfc` and `nk1=nk2=nk3`. I tested with `ecutwfc=6` and `nk1=nk2=nk3=6`, but you can choose other values if they are more appropriate. Make input files in which you vary the lattice constant, i.e., `celldm(1)`, in steps. Then, run the SCF calculations.

By plotting the Total energy in Ry vs. lattice const in Bohr, We observe that the energy is symmetric about the minimum value. This minimum value corresponds to the equilibrium lattice constant.
