% input data
function [input_dec_string]= input_data_trial1
input_dec_string = unicode2native('Two One Nine Two','utf-8');
st1=['Plain text    :',char(input_dec_string)];
disp(st1)
% Converts the input string of data"Plain text" into its decimal equivalent

