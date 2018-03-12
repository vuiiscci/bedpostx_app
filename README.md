# bedpostx_app
This includes everything required to build a docker and corresponding singularity container for the [bedpostx](https://github.com/justinblaber/bedpostx) pipeline.

# Build Instructions:
Just clone and run `build.sh`
```
git clone https://github.com/justinblaber/bedpostx_app.git
cd bedpostx_app/
./build.sh
```

# Run Instructions:
For docker:
```
sudo docker run --rm \
--runtime=nvidia \
-v $(pwd)/INPUTS/:/INPUTS/ \
-v $(pwd)/OUTPUTS:/OUTPUTS/ \
--user $(id -u):$(id -g) \
justinblaber/bedpostx
```
For singularity:
```
singularity run -e \
--nv \
-B INPUTS/:/INPUTS \
-B OUTPUTS/:/OUTPUTS \
bedpostx.img
```
For more detailed instructions on the inputs please visit: [https://justinblaber.org/bedpostx/](https://justinblaber.org/bedpostx/)
