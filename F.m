function [F]= F(n, t)
    
 
 Q = [10000, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
 R = 1;
 
 F = mydlqr(Ad(n), Bd(n,t), Q, R);