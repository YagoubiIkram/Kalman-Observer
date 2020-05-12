function [V]= Voc(i, x)%M i= 1->160

       if x > 3502.67- (i)*11.17; 
           h=3.2;
       else
            h = a(i) + tan(-x*c(i) + 1.5)/b(i);
       end
V = h;

