%--------------------------------------------------------------------------
%------------------- AES implementation using MATLAB ----------------------
% This is the main program which calls the functions for executing each step 
%                    included in AES algorithm. 
%--------------------------------------------------------------------------
clear;
tic;
input_data = input_data_trial1; % This function gets the 16 bytes of data  
                                % in their decimal equivalent into 
                                % input_data
                                
key_data = key_original;        % This function gets the 16 byte key in its 
                                %  decimal equivalent into key_data
                                
state_array = xoring_function_trial1(input_data,key_data); % This function adds the
                                % first round key and draws the first state
                                % matrix. The function is given intup 16
                                % bytes and 16 byte key as the input.                     
%-------------------------------------------------------------------------- 
%------------------------ KEY EXPANSION ALGORITHM -------------------------
%--------------------------------------------------------------------------
Rcon123;                        % This function will return Round key for 
                                % all the key expansion rounds
for i=2:11                          
key_data(i,:)= key_expansion_round2(key_data(i-1,:),Rcon2(i-1,:));%this function will 
                                % produce word4 to word7 of Key Schedule
end
                                % The above for loop will make key schedule
                                % and store it. The function key_expansion_round2
                                % gives back 4 works at a time of the key
                                % schedule. It takes inputs as the earlier
                                % 4 words of the schedule and Rcon of that
                                % round of key expansion.                                      
%--------------------------------------------------------------------------
%------------------------ AES ENCRYPTION ----------------------------------
% The following loop are the Round 1 to Round 9 of encryption. Each round
% has 4 steps viz Byte substitution, shifting rows , mixing columns and
% adding round key. Each function 
%--------------------------------------------------------------------------
for i=1:9
%------------------------- Byte substitution ------------------------------
state_array = byte_sub(state_array);    % returns new state array after byte
                                % substitution.
%-------------------------- Shifting Rows ---------------------------------
state_array = shift_row(state_array);   % returns new state array after shift
                                % row operation on the input state array.
%--------------------------- Mixing Coulumns ------------------------------
state_array = mix_columns(state_array); % returns new state array after mix
                                % column operation on the input state array.
%---------------------------- Add round key -------------------------------
state_array=xoring_function_trial1(state_array,key_data(i+1,:));
                                % returns new state array after adding
                                % round key to the input state array.
                                % The function takes state array and 
                                % correcponding words from key schedule.                     
end


%Round 10 of AES encyption has only 3 steps viz Byte substitution,Shift row
% and adding round key
state_array=byte_sub(state_array);  % Byte substitution 
state_array = shift_row(state_array);   % SHIFTING ROWS
state_array=xoring_function_trial1(state_array,key_data(11,:));%add round key                               
st=['Cipher text   :',char(state_array)];
disp(st)



%--------------------------------------------------------------------------
%-------------------------- AES Decryption --------------------------------
%--------------------------------------------------------------------------
%-------------------------- ADD ROUND KEY ---------------------------------
state_array=xoring_function_trial1(state_array,key_data(11,:));

%---- Round 1 to Round 9 of decryption ------------------------------------
 for i=10:-1:2 
%---------------- Inverse Shifting Rows -----------------------------------
state_array = inv_shift_row(state_array);% returns new state array
                                % after inverse shifting rows operation on 
                                % the input state array. 
%---------------- Inverse Byte substitution -------------------------------
state_array = inv_byte_sub(state_array);% returns new state array 
                                % after inverse Byte substitution operation  
                                % on the input state array.
%----------------- Add Round key ------------------------------------------
state_array = xoring_function_trial1(state_array,key_data(i,:));
                                % returns new state array 
                                % after adding round key on the input state array.
%----------------- Mixing column ------------------------------------------
state_array  = inv_mix_columns(state_array);% returns new state array 
                                % after mixing column operation on the
                                %  input state array.
 end

%--------------- Round 10 of Aes Decryption -------------------------------
%---------------- Inverse Shifting Rows -----------------------------------
state_array = inv_shift_row(state_array);
%---------------- Inverse Byte ubstitution -------------------------------
state_array = inv_byte_sub(state_array);
%---------------- Add Round Key -------------------------------------------
state_array = xoring_function_trial1(state_array,key_data(1,:));
%--------------------------------------------------------------------------
state_array_char = ['Decrypted text:',char(state_array)];
disp(state_array_char)
toc
