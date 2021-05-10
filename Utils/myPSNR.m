function [RMSE,PSNR] = myPSNR(T,T_hat,tensor_size)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baixi Sun
% This is a function that computes the PSNR and RMSE defined in TThresh
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    mul=1;
    for i = 1:length(tensor_size)
        mul = mul*tensor_size(i);
    end
    RMSE = norm(minus(T,T_hat))/sqrt(mul);
    diff_max_min = max(double(T(:))) - min(double(T(:)));
    RMSE_times2 = 2 * RMSE;
    PSNR = 20 * log10(diff_max_min/RMSE_times2);
end