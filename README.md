# matGadgets
Some gadgets implemented by Matlab.

Version History: 
    May 10, 2021 Created repo and uploaded main body.
    
Function Structure:
  1. demo.m: This is the demo part that shows how to run the fullTucker function.
  2. fullTucker.m: This is the full decomposition implementation of HOSVD (Tucker model).
  3. ./Utils/twoDigits.m: This is a function created to adapt the file names of corresponding dataset, in which you can simply iterate through the timestamps and         turn the number (especially less than 10) into two digits
  4. ./Utils/sortem.m: The function is used to sort the eigen matrix and then re-order the factor matrix with the sorted eigen matrix.
      https://www.mathworks.com/matlabcentral/fileexchange/18904-sort-eigenvectors-eigenvalues
  5. ./Utils/readTensorFile.m: This is a function created to read the file from defined directory.
  6. ./Utils/myUnfold.m: This is a function that unfolding tensor T on the mode n.
  7. ./Utils/myPSNR.m: This is a function that computes the PSNR and RMSE defined in TThresh.
