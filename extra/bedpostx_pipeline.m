try
    % Set job directory path
    job_dir_path = '/OUTPUTS/';
    
    % Set dwmri, bvec, bval, and mask paths
    dwmri_path = '/INPUTS/dwmri.nii.gz';
    bvec_path = '/INPUTS/dwmri.bvec';
    bval_path = '/INPUTS/dwmri.bval';
    mask_path = '/INPUTS/mask.nii.gz';
    
    % Set FSL path
    fsl_path = '/extra/fsl_5_0_10_bedpostx_cuda_8';
    
    % Read config file
    dtiqa_config = read_config('/INPUTS/bedpostx.conf');
          
    % Name of bedpostx executable
    bedpostx_name = dtiqa_config.bedpostx_name;

    % Bedpostx params 
    bedpostx_params = dtiqa_config.bedpostx_params;
    
    % Perform bedpostx pipeline
    bedpostx(job_dir_path, ...
             dwmri_path, ...
             bvec_path, ...
             bval_path, ...
             mask_path, ...
             fsl_path, ...
             bedpostx_name, ...
             bedpostx_params);                                                 
catch e
    disp(['Matlab script failed. Reason: ' getReport(e)]);
    exit(1);
end
exit(0);
