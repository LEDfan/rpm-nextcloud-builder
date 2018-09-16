This project contains a Dockerfile which can be used to build the Nextcloud RPM.
To build the RPM:
 1. clone this repo:
```
git clone https://github.com/ledfan/rpm-nextcloud-builder --recursive
```
 2. build the docker container
```
docker build -t rpm-nextcloud-builder --build-arg HOST_UID=`id -u` --build-arg HOST_GID=`id -g` .
```
 3. run the docker container
```
docker run --cap-add=SYS_ADMIN --security-opt apparmor:unconfined -it --volume `pwd`/rpm-nextcloud:/data rpm-nextcloud-builder
```
 4. The RPM pacakge will be available in `rpm-nextcloud/RPMS/`
