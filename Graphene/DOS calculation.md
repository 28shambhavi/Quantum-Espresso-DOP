DOS CALCULATION:
Firstly, run an scf calculation just like in the above calculation. Then, for doing nscf calculation we use the pw.x library to launch. The only change in the input file that occurs here is the change of parameters: calculation='nscf' and occupations = 'tetrahedra' :

$ pw.x<gr.nscf.in>g_nscf.out

For calculation of DOS we use the projwfc.x library to launch the input file:

$ projwfc.x<g_dos.in>gr.dos.out

Now we take the values from the output file: "graphene.pbe.pdos.pdos_tot" and plot in a suitable graph plotting software. Eg: Xmgrace

$ xmgrace dosdata.dat 

Where dosdata.dat is the file containing the data in "graphene.pbe.pdos.pdos_tot" file. Through this data one can plot the upspin and downspin by importing specific coloums in the plotting software.
