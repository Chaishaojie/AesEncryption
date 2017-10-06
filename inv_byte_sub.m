function [state_array]=inv_byte_sub(input_state_array)

inv_sbox;                   % this returns inverse _s_box matrix

% This loop will stubstitue each byte of state array by its equivalent in
% inverse _s_box matrix
for i=1:16
    temp=dec2hex(input_state_array(i),2);
    rowi=hex2dec(temp(1))+1;        % row index from each byte of state array
    columni=hex2dec(temp(2))+1;     % column index
    aes_byte_dec(i)= inv_s_box(rowi,columni);   % byte substitution from
                                            % inv_sbox using row and column index
end
state_array=aes_byte_dec;