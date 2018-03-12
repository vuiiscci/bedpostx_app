mkdir -p /OUTPUTS/.local/tmp && \
mkdir -p /OUTPUTS/.local/home && \
cd /OUTPUTS/.local/home && \
python3 /extra/validate_docker_inputs/validate_docker_inputs.py && \
source /extra/fsl_5_0_10_bedpostx_cuda_8/etc/fslconf/fsl.sh && \
xvfb-run -a --server-args="-screen 0 1920x1200x24 -ac +extension GLX" /extra/bedpostx_pipeline && \
rm -rf /OUTPUTS/.local
