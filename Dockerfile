FROM centos:8

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* \
&& sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* \
&& curl https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo -L -o /etc/yum.repos.d/CentOS-Base.repo \
&& yum clean all \
&& yum makecache 

RUN yum install git gcc-c++ make cmake gdb clang lldb -y

# BUGS for centos:8 https://bugs.centos.org/view.php?id=18212
RUN yum install libarchive-3.3.3-1.el8.x86_64 -y

# install rsync for clion
RUN yum install rsync -y

RUN yum install openssh-server openssh-clients passwd  -y; \
sed -i "s/^UsePAM yes/UsePAM no/g" /etc/ssh/sshd_config; \
echo 123456 | passwd root --stdin; \
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa; \
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys; \
chmod 0600 ~/.ssh/authorized_keys; \
ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key; \
ssh-keygen -q -N "" -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key; \
ssh-keygen -q -N "" -t ed25519 -f /etc/ssh/ssh_host_ed25519_key;
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
