
%% Parameter definition
Nf = 2; % Numer of evaluated eigenfrequencies
OrdPlt = 10; % Highest order for visualization
OrdStp = 0.5; % Order steps in diagram

% Moment of inertia [kg*m^2]
J1=0.0000199; 
J2=0.0016958;
J3=0.0021595;
J4=0.0018157;
J5=0.0012602;
J6=0.0000154;

% Stiffness values [Nm/°]
c1_deg=3014;
c2_deg=2562;
c3_deg=2430;
c4_deg=2636;
c5_deg=2562;

% Convert to [Nm/rad]
c1=c1_deg/(pi/180);
c2=c2_deg/(pi/180);
c3=c3_deg/(pi/180);
c4=c4_deg/(pi/180);
c5=c5_deg/(pi/180);

%% Build six-mass-system
% Stiffnes matrix
C = [ c1	-c1     0       0       0       0;
      -c1   (c1+c2)	-c2     0       0       0;
      0     -c2     (c2+c3)	-c3     0       0;
      0     0       -c3     (c3+c4)	-c4     0;
      0     0       0       -c4     (c4+c5)	-c5;
      0     0       0       0       -c5     c5];

% Mass matrix
M = [ J1	0       0       0       0       0;
      0     J2	    0       0       0       0;
      0     0       J3	    0       0       0;
      0     0       0       J4	    0       0;
      0     0       0       0       J5	    0;
      0     0       0       0       0       J6];

% Damping matrix
D = [ 0	    0       0       0       0       0;
      0     0	    0       0       0       0;
      0     0       0	    0       0       0;
      0     0       0       0	    0       0;
      0     0       0       0       0	    0;
      0     0       0       0       0       0];

%% Solve eigenvalue problem
%e = Eigenvalues, x = Eigenvectors, s = Condition numbers
[x, e, s] = polyeig(C, D, M);

w0 = imag(e);
w0 = sort(w0(w0>0));
f0 = w0/(2*pi) % Convert to frequency [Hz]

%% Plot relative amplitudes
for i = 1:Nf
    % Calculation of the relative amplitude
    a1=1;
    a2=a1-((a1*J1)/c1)*(w0(i,1))^2;
    a3=a2-(((a1*J1)+(a2*J2))/c2)*(w0(i,1))^2;
    a4=a3-(((a1*J1)+(a2*J2)+(a3*J3))/c3)*(w0(i,1))^2;
    a5=a4-(((a1*J1)+(a2*J2)+(a3*J3)+(a4*J4))/c4)*(w0(i,1))^2;
    a6=a5-(((a1*J1)+(a2*J2)+(a3*J3)+(a4*J4)+(a5*J5))/c5)*(w0(i,1))^2;

    % Visualisation of the relative amplitude
    a=[a1 a2 a3 a4 a5 a6]';
    index = (1:6)';
    subplot(Nf,1,i)
    plot(index, a,'b-', 'LineWidth', 1)
    grid on
    xlabel('Mass No.');
    ylabel('Rel. amplitude');
    xticks(1:6)
    legend (['Mode: ' num2str(i) ': ' num2str(round((w0(i,1)/(2*pi)),0)) ' Hz'])
    set(gcf,'color','w');
    hold on

end


%% Print order diagram
n = [0:15:15000]; % Define RPM range
f = n/60;
Modes=[];

for m = 1:Nf
    mode = f0(m) * ones(1001, 1);
    Modes = [ Modes, mode ];
end

v=figure;
set(v,'Color',[1 1 1]);

for i = 0 : OrdStp : OrdPlt
    Ord=f*i;
    plot(n,Ord,'Color', [0.35 0.35 0.35],'LineWidth',1.25)
    title('Order diagram');
    xlabel('RPM');
    ylabel('Frequency in Hz');
    text(15000,Ord(1,1001),[num2str(i) '.'])
    xticks([0:1000:15000]);
    yticks([0:250:2500]);
    xtickangle(45)
    grid on
    hold on
end

hold on

for j=1:1:Nf
    plot(n, Modes(:,j) ,'r', 'LineWidth',1.5)
    text(1000, Modes(1,j), [num2str(Modes(1,j)) ' Hz'])
    hold on 
end


% MIT License
% 
% Copyright (c) 2020 Philipp Biedenkopf
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.