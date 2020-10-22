## Crankshaft rotary transducer

'Calculate_eigenfrequency.m' is a Matlab script for analytical modal analysis of rotary transducers. 
It was used to calculate the torsional eigenfrequencies of a modified Honda CBR600 RR crankshaft for 
a Formula Student car. The model for crankshaft consits of a six-mass-system and only has rotational degrees 
of freedom. 

![Alt text](./analogous_model.png?raw=true "Title")

The contained stiffness and inertia values refer to the original Honda part and are estimated 
using an accurate 3D-scan CAD model and FEA simulation. The script calculates the eigenfrequencies and plots an
'image wave' ´for each eigenmode. For further information on this topic, please refer to [Knütscher2006](https://books.google.de/books?id=UANwAAAACAAJ&dq=vogel+k%C3%BCntscher+kraftfahrzeugmotoren+2006&hl=de&sa=X&ved=2ahUKEwjG1L3y-MfsAhWjoXEKHXv7Ab4Q6AEwAHoECAAQAg).
The model is validated with an additional modal analysis using FEA simulation and measurements using impuls hammer method. 

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

The system is evaluated by solving the equation of motion:
<img src="https://render.githubusercontent.com/render/math?math= \underline{M} \vec{\ddot{\phi}}\plus\underline{K} \vec{\phi}\plus\underline{K} \vec{\dot{\phi}} = \vec{0}">

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