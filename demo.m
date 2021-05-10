function demo()
    %%Baixi Sun
    %%This is the demo part that shows how to run the fullTucker function

    %%Add toolboxes path
    addpath('tensor_toolbox-v3.2.1');
    %Add Utils folder to path
    addpath('Utils');
    %%Define the field name here
    prefix = 'CLOUDf';
    %%Define the source binary tensor folder
    folder_dir = './CLOUDf/';
    %%Define the result output folder
    result_dir = strcat('/results/',prefix,'/');
    %If result dir not exist, create one
    if ~exist(result_dir, 'dir')
        disp('No defined folder detected, making dir...');
        mkdir(result_dir);
    end
    tensor_size = [500,500,100];%Define the tensor size.
    %48 timestamps
    total_time=48;
    for time_iter=1:total_time
        name_iter_str = twoDigits(time_iter);%Prepare the filename
        current_file_name = strcat(prefix,name_iter_str,'.bin');
        disp(strcat('Now reading:',current_file_name));
        T = readTensorFile(folder_dir,current_file_name,tensor_size,'float');
        [Tucker_core,U_out]=fullTucker(T);
        core_filename=strcat(result_dir,prefix,name_iter_str,'_core.raw');
        core_double = double(Tucker_core);
        core_fileID = fopen(core_filename,'w');
        fwrite(core_fileID,core_double,'float64');
        fclose(core_fileID);
        for i=1:ndims(Tucker_core)
            U_filename=strcat(result_dir,prefix,name_iter_str,'_U',num2str(i),'.raw');
            U_i = U_out{i};
            U_fileID = fopen(U_filename,'w');
            fwrite(U_fileID,U_i,'float64');
            fclose(U_fileID);
        end
        %%Compute the error
        T_recon = ttensor(Tucker_core,U_out);%Reconstruct from the tucker mdoel.
        relerr = norm(minus(T,T_recon))/norm(T);%relative error
        [RMSE,PSNR] = myPSNR(T,full(T_recon),tensor_size);%PSNR and RMSE
        %%Print out the results for the full decomposition
        disp('------------------PRINTS----------------------');
        disp(strcat('Timestamp: ',name_iter_str));
        disp(strcat('Diff is: ',num2str(relerr)));
        disp(strcat('RMSE is: ',num2str(RMSE)));
        disp(strcat('PSNR is: ',num2str(PSNR)));
        disp('-------------------END------------------------');
        disp('  ');
    end
end