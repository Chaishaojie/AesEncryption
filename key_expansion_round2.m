function [round1_key_dec]=key_expansion_round2(key_data,Rcon)
%--------------------------------------------------------------------------
%--------------------- KEY EXPANSION ALGORITHM  ---------------------------
%--------------------------------------------------------------------------

left=key_data(13:16);           % Getiing the last word form the 4 words
%--------------------------------------------------------------------------
%------------ Shifting one bye left circular rotation on  Wi+3 ------------
%--------------------------------------------------------------------------
left_1=left(1);
left_main=zeros(1,1);
for i=2:4
   left_main(i-1)=left(i); 
end
left_main(4)=left_1;

%--------------------------------------------------------------------------
%------------------- Byte Substituting from s-box -------------------------
%--------------------------------------------------------------------------

s_box;
for i=1:4
temp=dec2hex(left_main(i),2);
row=hex2dec(temp(1))+1;
column12=hex2dec(temp(2))+1;
substituted_byte_dec(i)= sbox1(row,column12);
end

%--------------------------------------------------------------------------
%--------- Add round key and generating G function "g(Wi+3)"---------------
%--------------------------------------------------------------------------
h1=hexToBinaryVector(dec2hex(Rcon(1)),8);
h2=hexToBinaryVector(dec2hex(substituted_byte_dec(1)),8);

gw31=hex2dec(binaryVectorToHex(bitxor(h1,h2)));% first element RC[i]

gw3_dec=[gw31 substituted_byte_dec(2:4) ]; %Rcon[i]

%--------------------------------------------------------------------------
%---------------- Calculating Wi+4 from Wi xor g(Wi+3) --------------------
%--------------------------------------------------------------------------
w4_dec=xoring_function_trial1(gw3_dec,key_data(1:4));

w5_dec=xoring_function_trial1(w4_dec,key_data(5:8));

w6_dec=xoring_function_trial1(w5_dec,key_data(9:12));

w7_dec=xoring_function_trial1(w6_dec,key_data(13:16));
round1_key_dec=[w4_dec w5_dec w6_dec w7_dec];

%--------------------------------------------------------------------------
