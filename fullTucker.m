function [Tucker_core,U_out]=fullTucker(T,T_size,Options)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baixi Sun
% To run this code we need supporting tensortoolbox-v3.2.1 code :
% https://gitlab.com/tensors/tensor_toolbox/-/releases/v3.2.1 and add it 
% to path
% addpath('tensor_toolbox-v3.2.1'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Implementation of full Higher-order singular value decomposition (HOSVD) 
%or Tucker decomposition.    
%   
%   Inputs:
%           1.T:Input tensor to be decomposed. It can be a double array of
%           any size, or tensor struct defined in tensor toolbox.
%  
%           2.T_size: The size of a tensor. It is a n by 1 array, where n
%           is the number of dimensions of the input tensor T.
%
%           3.Options: For future different options use. e.g. truncated
%           options and error tolerence rate
%
%   Outputs:
%           1.Tucker_core: Core tensor of Tucker model. It is the tensor
%           struct defined in tensor toolbox.
%           
%           2.U: Factor matrix of Tucker model. It is a cell
%           array with the size of input tensor's dimension
%
%   Version History:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    
    %Add toolboxes to path
    addpath('tensor_toolbox-v3.2.1');
    %Add Utils folder to path
    addpath('Utils');
    if nargin < 2
        full_decomposition = true; 
    end
    if nargin == 3
        disp('Not yet supported. More functions is on the way!');
    end
    tic
    N= ndims(T);
    U = cell(N,1);
    B_fold = T;
    for n = 1:N
        [B,flag] = myUnfold(B_fold,n);
        B_hat = B*B';
        %Using the eig instead of eigs because of we want the full decomposition
        %Reference: https://stackoverflow.com/questions/5855231/what-is-the-difference-between-eig-and-eigs#:~:text=eig%20is%20a%20good%2C%20fast,all%20of%20the%20eigenvalues%2Fvectors.&text=Eigs%20is%20a%20solver%20that,subset%20of%20the%20eigenvalues%2Fvectors.
        [U{n},V] = eig(B_hat);
        [U{n},V] = sortem(U{n},V);
        B_fold = ttm(B_fold,U{n}',n);
    end
    Tucker_core = B_fold;
    U_out = U;
    disp('HOSVD done!');
	toc

end