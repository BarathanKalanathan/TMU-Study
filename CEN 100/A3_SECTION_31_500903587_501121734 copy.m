%Section 31: Barathan Kalanathan 501121734,Nico Ramos 500903587

clc

%Question 1)
%a)

display('Question 1')
display('Use MATLABs ROOTS operator to solve the following polynoial functions')
display('a)')
display('Find roots of f(x)=x^2+x-2')
a=[1 1 -2]
RootsA=roots(a)

display('b)')
display('f(y)=6-2y^3')

b=[-2 0 0 6]
RootsB=roots(b)

display('Question 2')
display('a)')
% 1. x-2y+3z=7
% 2. 2x+y+z=4
% 3. -3x+2y-2z=-10

display('Let M represent the coeffectient matrix')

M=[1,-2,3;2,1,1;-3,2,-2]

display('b)')
display('Let N represent the constant column matrix')
N=[7;4;-10]


display('c)')
display('Find X Matrix, the row matrix for the variables for which M*X=N and X=M/N')

X=inv(M)*N

display('Question 3')
display('Use MATLABs FZERO operator to find the roots of the following functions in the given interval')

%Question 3

%1)

display('Q3-1) 3cosx=x/2 on [0,2pi]')

f1 = @(x) 3*cos(x)-x/2
x1 = [0,2*pi];

fzero (f1,x1)

%2)

display('Q3-2) e^-0.1x = 4x-3 on [0,4]')

f2 = @(x) exp(-0.1*x)-4*x +3
x2 = [0,3];

fzero (f2,x2)

%3)

display('Q3-3) 5x^2 + 6x = -1 on [-2,-1]')

f3 = @(x) 5*x^2+6*x +1
x3 = [-2,-1];

fzero (f3,x3)

%Question 4

display ('Question 4 b)')
display ('Use Fsolve to call the function "Nonlinear with x = 2, y = 2 as the starting point" ')

%2)

options = optimset('Display','iter');
fsolve('Nico_Ramos_Barathan_Kalanathan', [2 2],options)

display ('Matlab used 10 iterations  to solve the equations')