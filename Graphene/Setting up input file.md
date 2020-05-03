SETTING UP THE INPUT FILE for SINGLE LAYER: In the scf file, K_POINTS automatic: 24 24 1 0 0 0, are advisable as the minimum number if K points. One can take 12 12 1 0 0 0 also but the graphs obtained do not do justice to the calculation. The greater the K point mesh, the more accurate the calculations become. Especially in the case of DOS calculations.

Magnetic Properties displayed by agraphene can be tested by including these parameters under the &SYSTEM card nspin=2, nbnd = 16, starting_magnetization(1)=0.5

ATOMIC_POSITIONS angstrom 

C 0.000000000 0.000000000 5.000000000 

C 0.000000000 1.424500000 5.000000000


--------------------------------------------------------------------------------


SETTING UP THE INPUT FILE for BILAYER: The rule for K points remains valid here as well. An example of the Atmic positions for AA Bilayer has been given below:

For AA Bilayer:

ATOMIC_POSITIONS angstrom 

C 0.000000000 0.000000000 5.000000000 

C 0.000000000 1.424500000 5.000000000 

C 0.000000000 0.000000000 8.520000000 

C 0.000000000 1.424500000 8.520000000

Now, instead of just two carbon atoms we specify the atomic positions for 4 of them. The interlayer distance is added as well. 

For AB Bilayer we just change the positions of the x and y coordinates. All computation methods remain the same for every type analysed. Be it single layer, AA bilayer or AA bilayer.
