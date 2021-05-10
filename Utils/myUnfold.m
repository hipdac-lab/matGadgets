function [matrix_T,flag] = myUnfold(T,n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baixi Sun
% This is a function that unfolding tensor T on the mode n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    flag = -1;
    switch class(T) %B is T unfolded on the n-th mode
    case {'tensor'} %dense
        matrix_T = double(tenmat(T,n));
        flag = 1;
    case {'sptensor'} %sparse
        matrix_T = double(sptenmat(T,n));
        flag = 0;
    end
end