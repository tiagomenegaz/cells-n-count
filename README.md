# Contact 

This is my Matlab solution to the second question of the first Assignment of CITS2401.

This is the description of the problem.

"There are many examples from engineering and science where we need to determine the number of contacts between a large number objects. For example, 

• Molecular dynamic simulation is used to simulate the interaction of atoms and molecules. A similar approach called the discrete element method is used to simulate soils particles in geotechnical engineering. A key part of these simulation methods requires the identification of contacts between atoms of grains of sand.

• Looking at cells on a microscope slide we may wish to know how many cells are in contact (i.e., direct communication) with another cell.

• In a chemical process where bubbles are used to aerate a reaction occurring in a fluid bath, we may be interested in measuring bubble-bubble interactions.

The general problem is one of extracting information from a large collection of objects automatically. The task now is to write a Matlab function to do just that.

Specifically, write a Matlab function file calledcontact.m that takes in as an input the X-Y position and radius of a collection of circles as a single (3xN or Nx3) variable. The function should output (in this order) (1) the total number of
overlapping circles (contacts), (2) the average number of contacts per circle and Note the input variable may be a 3xN or Nx3 array and so your function should A contact is defined as having occurred when the distance between the centres of 
two circles is less than or equal to the sum of the two radii involved. Note there is Example data files are included (A_3xN.txt and A_Nx3.txt), with expected outputs, for checking your code. (...)"
