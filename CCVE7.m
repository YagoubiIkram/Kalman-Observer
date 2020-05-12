 clearvars ;

% the constants
 J = 6.8e-3 ;%Kg.m^2 
 Ke = 0.47 ; % Nm/A
 Rmotor = 3.33 ; % Ohm
 Te = 0.010 ; % seconds
 c = 1e-9; % 
 L = 0.2;
 Rmotor = 3.33 ; % Ohm
 thau = 0.5;
 V_int = 5;
 R_int =0.06;
 k =  -R_int*0.74/L -Rmotor/L ;
 
 % instantiate variables
 
 N_cycle = 1;
 
Cd = [1, 0, 0, 0, 0, 0; 0, 0, 1, 0, 0, 0];
X = [0; 0; 0; 0];
Xref =[-20; 0; 0; 0];
Xe = [-10; 0; 0; 0; 5; 0.06]; 
 
 
 y = Cd*[X; 0; 0];
 y_e = Cd*Xe;
 
 P = eye(6);
 Q =eye(6);
 R = eye(2);


 
for i = 1:500

    
    u = -F(N_cycle, i*Te)*(X-Xref);
    if u>1
        cycle_duty = 1;
    elseif u< -1
        cycle_duty = -1;
    else 
        cycle_duty = u;
    end 
    
    % x real
    X = Ad(N_cycle)*X + Bd(N_cycle, i*Te)*cycle_duty;
    % xe observed
     P = Ad_lpv(cycle_duty, y(2))*P*Ad_lpv(cycle_duty, y(2))' + Q;
     Lob = P*Cd'*(Cd*P*Cd' +R)';
     P = (eye(6) - Lob*Cd)*P;
     Xe = Ad_lpv(cycle_duty, y(2))*Xe + Lob*(y - Cd*Xe);

 %storage of values

    y_e = Cd*Xe;
    y = Cd*[X; 0; 0];
    theta(i) = X(1);
    theta_e(i)= Xe(1);
    omega(i) = X(2);
    omega_e(i)= Xe(2);
    courant(i) = X(3);
    courant_e(i)= Xe(3);
    thau(i) = X(4);
    thau_e(i)= Xe(4);
    ref(i) = Xref(1);
    rho(i)= cycle_duty;
    
end 


figure(1)
V1=[0.01:0.01:5 ];
%plot(V1,theta_e, "Color",'b',"LineStyle","-");
%hold on
plot(V1, theta, "Color",'r',"LineStyle","-");
hold on
plot(V1,theta_e, "Color",'b',"LineStyle","-");
hold on
plot(V1,ref,"--");
grid;
xlabel('Time(s)','Color','bl');
ylabel('\theta(rad)','Color','bl');
legend('\theta  ', '\theta obs','\theta ref' );




