% Part a)
tic                     %starts a timer
for i = 1:1:1024        %iterates over the rows of matrix B
  for j = 1:1:100     %iterates over the columns of matrix B
      if (abs(B(i,j)) < 0.01)  %for each element in B, check if the absolute value is less than 0.01
          B(i,j) = 0;          %if true, set to 0
      end
  end
end
fprintf ('\nD.2a ');
toc         %stops timer


% Part b
tic
B([abs(B)> 0.01]) = 0;   %applies logical indexing to B 
fprintf ('\nD.2b ');
toc
