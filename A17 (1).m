%Assignment 17b
clc, clear
format compact
syms P p R I L d k

R = (p*L)/((pi*d^2)/4);
P =R*(I^2);
Cost = k*(((pi*(d^2)/4)))*L;

Total_Cost= P + Cost ;

diff_d = diff(Total_Cost, d);
d1= solve(diff_d == 0 , d);
TC = subs(Total_Cost, d,d1);


d1_val = double(subs(d1,[I, L, p, k ], [100,1000, 1.68e-8, 5] ));
TC_val = double(subs(TC,[I, L, p, k, d], [100, 1000, 1.68e-8,5 ,d1_val(1)] ));
%Plot
TC_graph = subs(Total_Cost,[I, L, p, k], [100, 1000, 1.68e-8,5] );
ezplot(TC_graph, [0.05, 0.1])
title('Total Cost Function Graph: ')
xlabel('X')
ylabel('Y')
%DISP
disp('Values of d at which total cost is minumum: ')
disp(d1)
disp('Minimum Total Cost: ')
disp(TC)
disp('Numeric values of d at min: ')
disp(d1_val)
disp('Numerica Vlues of Total cost: ')
disp(TC_val)
%Output
%