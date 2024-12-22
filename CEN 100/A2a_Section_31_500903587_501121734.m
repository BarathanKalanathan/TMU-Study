%Section 31: Barathan Kalanathan 501121734,Nico Ramos 500903587

%Question 1)
%a)

display ('Question 1')

display ('Make Matrices')

A=[1,4,6;4,5,4;8,7,3]
B=[3,8,3;5,4,7;1,2,5]

display('a)')
display('let Cmatrix be Matrix C') 

Cmatrix=B*A
display('Find the sum of diagonal of matrix C=B*A')

C=sum(diag(B'+A))

display('b)')

display('Find the matrix product for the transpose matrix of C multiplied by Matric B, D=Ct*B')

D=Cmatrix.'*B

display('c)')

display('Find the product of the determinate of matrix C and the element Bt13')

display('let Z represent the product')

Z=det(Cmatrix)*B(1,3)



display('Question 2)')
display('a)')

display('Using the colon operator, construct the matrix E(3x3) such that:')
display('      1-its 1st column is the 2nd row of matrix B')
display('      2-its 2nd and 3rd columns are the same as those of matrix C that was obtained in question 1')



display('Matrix E')
E=[B(:,2),Cmatrix(:,2),Cmatrix(:,3)]

display('b)')
display('Calculate the inverse of Matrix E and sotre it in Matrix F')

F=inv(E)

display('c)')
display('Find the sum of all elements in matrix F')
display('Let s represent summ of all elements in matrix F')
s=sum(F,'all')


