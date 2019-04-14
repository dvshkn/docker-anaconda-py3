# docker-anaconda-py3
This dockerfile creates containers ready for numeric Python 3 development.

## Features
- Uses Anaconda for simpler dependencies
- Mounts a directory from the host to `~/data` inside the container
- Publishes a port to the host for accessing a Jupyter Notebook server

## Usage
1. Download an [Anaconda](https://www.anaconda.com/) installer to `files/anaconda_installer.sh`.
2. Copy the `config.example` file to `config` and edit the `DATA_DIR` value to point to a host directory that will be mounted inside the container.
3. Run the build script. This will create the docker image.
```
$ ./build.sh
```
4. Run the create script. This will create a docker container that is pre-configured to mount `DATA_DIR` and publish a port on `127.0.0.1`.
```
$ ./create.sh
```
5. Start and attach to the new container.
```
$ docker start -ai anaconda-py3
```
