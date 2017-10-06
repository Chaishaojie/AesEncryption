function[xoring_output]= xoring_function_trial1(data1,data2)
% This function will return xor the data1 and data2
% It first converts the datas into binary values and the xor's them 
% Converts back to decimal as return value to the function
leng=length(data1);
    for i=1:leng
        var1=hexToBinaryVector(dec2hex(data1(i)),8);
        var2=hexToBinaryVector(dec2hex(data2(i)),8);
        xoring1=binaryVectorToHex(bitxor(var1,var2));
        out1(i)=hex2dec(xoring1);
    end
xoring_output=out1;