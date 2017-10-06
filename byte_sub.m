function [state_array]=byte_sub(input_state_array)
% This function will return byte substituted state array of input state array
s_box;                      % this function will return sbox1 matrix

% This loop will stubstitue each byte of state array by its equivalent in sbox
for i=1:16
    temp=dec2hex(input_state_array(i),2);
    rowi=hex2dec(temp(1))+1;        % row index from each byte of state array
    columni=hex2dec(temp(2))+1;     % column index
    aes_byte_dec(i)= sbox1(rowi,columni);   % byte substitution form sbox 
                                            % using row and column index
end
state_array=aes_byte_dec;