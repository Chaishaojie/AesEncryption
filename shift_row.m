function[state_array]=shift_row(input_state_array)

ST_ARY_DEC=reshape(input_state_array,4,4);  % Converts the 16 bytes array
                                            % into 4x4 matrix
%--------------- This loop will shift row 2, 3 and 4 ----------------------
for i=2:4
    ST_ARY_DEC(i,:) = circshift(ST_ARY_DEC(i,:),-i+1,2);
end
state_array=reshape(ST_ARY_DEC,1,16);   % Converts the 4x4 matrix into
                                        % 16 bytes array
