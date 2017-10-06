function [main_output]=add_bits(input)
% This function is used to add bytes in matrix multiplication.
% the input is 4 byte of data after dot_operation 
% the output is byte addition of the 4 input bytes
    for i=1:4
       temp=dec2hex(input(i),2);
       input_bin(i,:)= hexToBinaryVector(temp,8);
    end
   
   b1= bitxor(input_bin(1,:),input_bin(2,:));
   b2= bitxor(input_bin(3,:),input_bin(4,:));
   b3= bitxor(b1,b2);
   main_output_bin = binaryVectorToHex(b3);
   
   main_output=hex2dec(main_output_bin);

