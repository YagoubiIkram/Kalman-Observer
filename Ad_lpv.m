function [Ad]= Ad_lpv(g,h)
     J = 6.8e-3 ;%Kg.m^2 
     Ke = 0.47 ; % Nm/A
     Rmotor = 3.33 ; % Ohm
     Te = 0.010 ; % seconds
     c = 1e-9; % 
     L = 0.2;
     Rmotor = 3.33 ; % Ohm
 
A = [0, 1, 0, 0, 0, 0;
     0, 0, Ke/J, -1/J, 0, 0;
     0, -Ke/L, - Rmotor/L, 0, g/L, -g*h/L ;
     0, 0, 0, -c, 0, 0;
     0, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 0 ];
 
Ad = A*Te+eye(6);
