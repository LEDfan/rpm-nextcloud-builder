FROM centos:7

ARG HOST_UID
ARG HOST_GID
ARG SUBDIR
ARG PKG_ITERATION

RUN yum -y update \
 && yum -y groupinstall "Development Tools" \
 && yum -y install rpm-build mock rpmdevtools unzip epel-release  yum yum-utils shadow-utils distribution-gpg-keys \
 && yum -y groupinstall "Buildsystem building group"
RUN echo ${HOST_UID} ${HOST_GID} && \
groupadd -g ${HOST_GID} jenkins && \
adduser -u ${HOST_UID} -G mock -g ${HOST_GID} jenkins
# otherwise mock failes because it provides both /usr/sbin/mock and /usr/bin/mock but rejects to run the first
ENV PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin"
WORKDIR /data
USER jenkins
CMD rm -rf pkg/*.rpm
CMD make minimalrpm
