function [operation_output]=dot_operation(input1,input2)

field=hexToBinaryVector(dec2hex(27),8); %field representation 0x1b
    
%--------- If multiplication(dot operation) by x01 over GF(2^8) -----------
if     input1==01               %   
    operation_output=input2;    % The input remains the same.
    
%-------------- If multiplication by 0x02 over GF(2^8) -------------------- 
elseif input1==02  

   operation_output=gf_mul(input2);% gf_mul multiplies 0x02 with input2 over GF(2^8)
       
%-------------- If multiplication by 0x03 over GF(2^8) --------------------   
elseif input1==03
    in2=dec2hex(input2,2);
    input2_bin=hexToBinaryVector(in2,8);    % input2 as binary(state matrix)
    
    output_bin1(1,:)=input2_bin(1,2:8);     % shifting bits to left
    output_bin1(1,8)=0;
    
    if input2_bin(1)==1                     % If the 1st bit of input is 1 then
       output_bin1= bitxor(output_bin1,field) ; % xoring with 0x1b  
    end
    
    op=bitxor(output_bin1,input2_bin);
    operation_output=hex2dec(binaryVectorToHex(op));
else
    operation_output=123456;
end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
