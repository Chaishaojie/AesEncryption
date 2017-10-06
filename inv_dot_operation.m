function [output]=inv_dot_operation(input1,input2)


    field=hexToBinaryVector(dec2hex(27),8);%field representation

    in2=dec2hex(input2,2);
    input2_bin=hexToBinaryVector(in2,8); % converting to binary

%-------- If multiplication(dot operation) by 0x09 over GF(2^8) -----------
if    input1==09       % in × 0x09=(((in×2)×2)×2)+in
    
    p1=gf_mul(input2);  % gf_mul multiplies 0x02 with input2 over GF(2^8)
    p2=gf_mul(p1);
    p3=gf_mul(p2);
    p4=xoring_function_trial1(p3,input2);
    output=p4;
    
%-------- If multiplication(dot operation) by 0x0b over GF(2^8) -----------   
elseif input1==11   % in × 0x0b =  (((in×2)×2)×2)+in
    
    p1=gf_mul(input2);  % gf_mul multiplies 0x02 with input2 over GF(2^8)
    p2=gf_mul(p1);
    p3=xoring_function_trial1(p2,input2);
    p4=gf_mul(p3);
    p5=xoring_function_trial1(p4,input2);
    output=p5;
    
%-------- If multiplication(dot operation) by 0x0d over GF(2^8) -----------    
elseif input1==13   % in × 0x0d =  (((in×2)×2)×2)+in
    p1=gf_mul(input2);  % gf_mul multiplies 0x02 with input2 over GF(2^8)
    p2=xoring_function_trial1(p1,input2);
    p3=gf_mul(p2);
    p4=gf_mul(p3);
    p5=xoring_function_trial1(p4,input2);
    output=p5;

    
%-------- If multiplication(dot operation) by 0x0e over GF(2^8) -----------      
elseif input1==14   % in × 0x0e =  (((in×2)×2)×2)+in
    p1=gf_mul(input2);  % gf_mul multiplies 0x02 with input2 over GF(2^8)
    p2=xoring_function_trial1(p1,input2);
    p3=gf_mul(p2);
    p4=xoring_function_trial1(p3,input2);
    p5=gf_mul(p4);
    output=p5;
       
end

