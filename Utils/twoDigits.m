function [digit2] = twoDigits(digit1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baixi Sun
% This is a function created to adapt the file names of Hurricane dataset,
% in which you can simply iterate through the timestamps and turn the
% number (especially less than 10) into two digits
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if digit1 < 10
        digit2 = strcat('0',num2str(digit1));
    else
        digit2 = num2str(digit1);
    end
end