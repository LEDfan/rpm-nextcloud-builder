FROM centos:7
RUN yum -y update \
 && yum -y groupinstall "Development Tools" \
 && yum -y install rpm-build mock rpmdevtools unzip epel-release  yum yum-utils shadow-utils distribution-gpg-keys \
 && yum -y groupinstall "Buildsystem building group"
RUN useradd -G mock builder
# otherwise mock failes because it provides both /usr/sbin/mock and /usr/bin/mock but rejects to run the first
ENV PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin"
