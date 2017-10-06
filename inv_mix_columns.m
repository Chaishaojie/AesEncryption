function [addop]=inv_mix_columns(ST_ARY_DEC)

%--------------------------------------------------------------------------
%------------------------ INVERSE MIXING COLUMN ---------------------------
%--------------------------------------------------------------------------

column_operation=[14 09 13 11 11 14 09 13 13 11 14 09 09 13 11 14];
%[0E 0B 0D 09
% 09 0E 0B 0D
% 0D 09 0E 0B
% 0B 0D 09 0E]

% this matrix is used for matrix multiplication over GF(2^8) while inverse 
% mixing columns
step=1;

% The following loop is used for matrix multiplication over GF(2^8) 
% Between column_operation matrix and state array
for j=1:4
% INV_Dot_operation is multiplication over GF(2^8) function
% this loop is used for multiplying row of column_operation matrix with 
% corresponding column of state array.
  for i=1:4 
      dot_op1(i,:,j)=inv_dot_operation(column_operation(step),ST_ARY_DEC(i));
      dot_op2(i,:,j)=inv_dot_operation(column_operation(step),ST_ARY_DEC(i+4));
      dot_op3(i,:,j)=inv_dot_operation(column_operation(step),ST_ARY_DEC(i+8));
      dot_op4(i,:,j)=inv_dot_operation(column_operation(step),ST_ARY_DEC(i+12));
      step=step+4;
  end 
    if(j==1)
      step=2;
    elseif(j==2)
      step=3;
    elseif(j==3)
      step=4;
    end
    
  % These add_bit is used for adding the result of dot operation to form each 
  % byte of s'matrix ie output of mix column operation.
   add_op1(j)=add_bits(dot_op1(:,:,j));
   add_op2(j)=add_bits(dot_op2(:,:,j));
   add_op3(j)=add_bits(dot_op3(:,:,j));
   add_op4(j)=add_bits(dot_op4(:,:,j));
end
  
  addop=[add_op1 add_op2 add_op3 add_op4];