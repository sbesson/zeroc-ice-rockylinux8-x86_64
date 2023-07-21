# Dockerfile for lowest common denominator Linux native artifact build
# --------------------------------------------------------------------
FROM rockylinux:8

RUN dnf update -y

RUN dnf install -y 'dnf-command(config-manager)' && \
    dnf config-manager --set-enabled powertools
RUN dnf install -y \
    bzip2-devel \
    expat-devel \
    gcc \
    gcc-c++ \
    make \
    openssl-devel \
    libdb-cxx-devel

# Install mcpp-devel from Ice 3.7 el8 repositories
RUN dnf install -y https://zeroc.com/download/ice/3.7/el8/ice-repo-3.7.el8.noarch.rpm && \
    dnf install -y mcpp-devel
