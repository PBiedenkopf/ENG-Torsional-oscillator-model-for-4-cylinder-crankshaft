## Crankshaft rotary transducer

'Calculate_eigenfrequency.m' is a Matlab script for analytical modal analysis of rotary transducers. 
It was used to calculate the torsional eigenfrequencies of a modified Honda CBR600 RR crankshaft for 
a Formula Student car. The model for crankshaft consits of a six-mass-system and only has rotational degrees 
of freedom. The model neglects the damping of the system.

![Alt text](./analogous_model.png?raw=true "Title")

The contained stiffness and inertia values refer to the original Honda part and are estimated 
using an accurate 3D-scan CAD model and FEA simulation. The script calculates the eigenfrequencies and plots an
'image shaft' ´for each eigenmode. The model is validated with an additional modal analysis using FEA simulation and 
measurements using impuls hammer method with acceptable results. The difference to the results of the experimental modal 
analysis and the FEA analysis is about 10% for the first eigenmode in this case. The main difficulty is the calculation of the 
stiffness values because they have to be very precise regarding the high impact on the results. There are alternatives to the 
calculation with FEA analysis. For more information refer to the methods of Carter and Tuplin in [Knütscher2006](https://books.google.de/books?id=UANwAAAACAAJ&dq=vogel+k%C3%BCntscher+kraftfahrzeugmotoren+2006&hl=de&sa=X&ved=2ahUKEwjG1L3y-MfsAhWjoXEKHXv7Ab4Q6AEwAHoECAAQAg). 

Note that this analysis only handles the torsional eigenfrequencies and no bending eigenmodes are calculated! 


## Usage

Within the header of the script the necessary parameters have to be defined. Nf defines the number of plottet
eigenmodes. Ji and ci define the inertia and stiffness values of the crankshaft. 

```Matlab
Nf = 3;

% Moment of inertia [kg*m^2]
J1 = 0.0000199; 
J2 = 0.0016958;
J3 = 0.0021595;
J4 = 0.0018157;
J5 = 0.0012602;
J6 = 0.0000154;

% Stiffness values [Nm/°]
c1_deg = 3014;
c2_deg = 2562;
c3_deg = 2430;
c4_deg = 2636;
c5_deg = 2562;
```
To deal with systems containing more or less masses, the inertia and stiffness matricies can simply be extended or simplified.
The six-mass-system is evaluated by solving the equation of motion with the polyeig function. 
```Matlab
[x, e, s] = polyeig(C, D, M);
```

The calculation of the relative amplitudes and the plotted 'image shaft' refers to [Knütscher2006](https://books.google.de/books?id=UANwAAAACAAJ&dq=vogel+k%C3%BCntscher+kraftfahrzeugmotoren+2006&hl=de&sa=X&ved=2ahUKEwjG1L3y-MfsAhWjoXEKHXv7Ab4Q6AEwAHoECAAQAg).
It shows the eigenmode-specific relative amplitude for each mass of the system. In the following you can see the first two 
torsional eigenmodes of the Honda Crankshaft and the corresponding frequencies. 
![Alt text](./image_shaft.png?raw=true "Title")


## License
MIT License

Copyright (c) 2020 Philipp Biedenkopf

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.