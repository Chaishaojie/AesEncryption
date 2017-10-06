function [out_data]= gf_mul(input2)

field=hexToBinaryVector(dec2hex(27),8);%field representation

    in2=dec2hex(input2,2);          
    input2_bin=hexToBinaryVector(in2,8);    % converting into binary
   
    output_bin(1,:)=input2_bin(1,2:8);
    output_bin(1,8)=0;                      % shifting left
    
    if input2_bin(1)==1
    output_bin= bitxor(output_bin,field) ;   % xoring with 0x1b
    end
    
   op1=binaryVectorToHex(output_bin);
   output_dec = hex2dec(op1);               % converting to decimal
    
   out_data=output_dec;


