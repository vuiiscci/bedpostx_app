# bedpostx_app
This includes everything required to build a docker and corresponding singularity container for the [bedpostx](https://github.com/justinblaber/bedpostx) pipeline.

[Docker Hub](https://hub.docker.com/r/justinblaber/bedpostx/tags/)

[Singularity Hub](https://singularity-hub.org/collections/727)

# Build Instructions:
Just clone and run `build.sh`:
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
shub://justinblaber/bedpostx_app
```
For more detailed instructions on the inputs please visit: [https://justinblaber.org/bedpostx/](https://justinblaber.org/bedpostx/)
