function [Bd]= Bd(n,t)
     J = 6.8e-3 ;%Kg.m^2 
     Ke = 0.47 ; % Nm/A
     Rmotor = 3.33 ; % Ohm
     Te = 0.010 ; % seconds
     c = 1e-9; % 
     L = 0.2;
     Rmotor = 3.33 ; % Ohm
 
    k = (Voc(n,t)-Rint(n)*1.1)/L;
   B = [0; 0; k; 0];
    
Bd = B*Te;
