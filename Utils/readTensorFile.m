function [T] = readTensorFile(folder_dir,file_name,tensor_size,precision)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baixi Sun
% This is a function created to read the file from defined directory.
% 	Inputs:
%           1.folder_dir: The absolute directory(suggested) of the file to
%           read.
%           2.file_name: The file name to read.
%           3.tensor_size: An dim*1 array indicating the size of the
%           tensor, where dim is the dimension of that tensor.
%           4.precision: either 'double' or 'float' supported.
%   Output:
%           1.T: the tensor from file in the format of 'tensor' in toolbox.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    data_fid = fopen(strcat(folder_dir,file_name));
    if(strcmp(precision,'double'))
        data_array = fread(data_fid,'float64');
    elseif(strcmp(precision,'float'))
        data_array = fread(data_fid,'float32');
    else
        disp('Precision not supported. Use double or float');
        return
    end
    T = tensor(data_array,tensor_size);
    disp('Tensor read!');
    %Creating random small tensor for testing
    %{ 
    info = create_problem('Size', tensor_size, 'Num_Factors', 3, 'Noise', 0.10);
    T = info.Data;
    %}
end