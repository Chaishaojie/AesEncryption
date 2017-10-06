function[state_array]=inv_shift_row(input_state_array)

ST_ARY_DEC=reshape(input_state_array,4,4);  % convert 16 byte stream into 
                                            % 4x4 matrix
% This loop will shift row 2 to 4
for i=2:4
    ST_ARY_DEC(i,:) = circshift(ST_ARY_DEC(i,:),i-1,2);
end
state_array=reshape(ST_ARY_DEC,1,16);       % convert 4x4 matrix into 
                                            % 16 byte stream
