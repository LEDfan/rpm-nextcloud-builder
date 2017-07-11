This project contains a Dockerfile which can be used to build the Nextcloud RPM.
 1. run the docker container:
 `docker run --cap-add=SYS_ADMIN -it --volume /path/to/rpm-nextcloud-builder/rpm-nextcloud:/data a1f949680bd5 /bin/bash`
 2. run `su builder`
 3. run `make minimalrpm`
 3. the rpm will be build inside `rpm-nextcloud/pkg`
