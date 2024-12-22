%Section 31: Barathan Kalanathan 501121734,Nico Ramos 500903587

%Question 1)

%a)

display('Question 1')

display('a)')

display('Define given variables')

Vi = 0
Vf = 180
ti = 0
tf = 10

%b)
display('b)')

display('Since the final velocity was provided in km/h, convert to m/s')

Vf = 180*5/18

display('Find the average acceleration')

a_avg = (Vf-Vi)/(tf-ti)

fprintf('The average accelearation is %d m/s^2. \n',a_avg);

%c)

display('c)')
display('Find the distance the car traveled for the first 10s assuming constant acceleration')

x = 1/2 * (Vi+Vf) * tf

fprintf('The car traveled a distance of %d m. \n',x);

%d)

display('d)')

display('Change the value of the time variable')

tf = 12

display('Find the final speed after 12s')

Vff = Vi + (a_avg*tf)

display('Convert m/s to km/h')

Vkmh = Vff * 3.6

fprintf('The speed of the car after 12s is %d m/s. \n',Vkmh);

fprintf('\n');

%Question 2)
display('Question 2')

display('Create matrices')

A = [2,4,-1;-1,5,3]
B = [3,6,-1;4,-2,2]
C = [2,4;1,3]
D = [-1,3;4,2]

%a)

display('a) -3B')

Q2a = -3*B

%b)

display('b)3A-B')

Q2b = (3*A)-B

display('c) D^2')

%c)
Q2c = D^2

display('d) Element-wise product of matrix C and D')

%d)
Q2d = C.*D

fprintf('\n');

%Question 3
display('Question 3')

display('Declare variable for Fahrenheit temperature')
F = 100

display('Convert to Celsius')

C = 5/9 *(F-32)

fprintf('100 degrees Fahrenheit is approximately %0.2f degrees Celsius \n',C);

fprintf('\n');

%Question 4

display('Question 4')

display('Declare given variables')
m = 2400

s = 10

display('Convert mass from g to kg and side length from cm to m')
m = m/1000

s = s/100

display('Find the volume')

V = s^3

display('Find the density')

d = m/V

fprintf('The density of the cube of concrete is %0.0f kg/m^3',d);
