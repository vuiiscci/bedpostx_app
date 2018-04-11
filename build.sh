#!/bin/bash
set -e 

# extra contains all code/data
cd extra

# Update git repos
GIT_REPOS="read_config system_utils nifti_utils dwmri_visualizer bedpostx validate_docker_inputs"
for GIT_REPO in $GIT_REPOS;
do 
	if [ -d "$GIT_REPO" ]; then
       		echo git pulling $GIT_REPO
        	cd $GIT_REPO
        	git pull
        	cd ..
	else
		echo git cloning $GIT_REPO
        	git clone https://github.com/justinblaber/$GIT_REPO
	fi
done

# Compile MATLAB script
MATLAB_DIRS="read_config system_utils nifti_utils dwmri_visualizer bedpostx"
SCRIPT=bedpostx_pipeline
MCC_CMD='mcc -mv '$SCRIPT'.m'
for MATLAB_DIR in $MATLAB_DIRS;
do 
	MCC_CMD=$MCC_CMD' -a '$MATLAB_DIR
done

matlab -nosplash -nodesktop -r "try, ""$MCC_CMD""; catch e, disp(['Matlab script failed. Reason: ' getReport(e)]); exit(1); end, exit(0);"

# Set permissions 
chmod +x $SCRIPT

# Build docker
cd ..
sudo docker build --rm -t vuiiscci/bedpostx:latest .

# Push docker - note this only affects latest tag. Must retag and push if you want to give a specific tag
sudo docker push vuiiscci/bedpostx:latest
