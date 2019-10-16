
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG libpcap_version=1.9.0
ARG nmap_version=7.9.0

USER root
RUN mkdir -p /home/shell/softwares
WORKDIR /home/shell/softwares

# Install Prepare
RUN apt-get -y install flex bison

# Install libpcap
RUN wget http://www.tcpdump.org/release/libpcap-1.9.0.tar.gz | tar zxvf - && cd libpcap-1.9.0 && \
    ./confugure --prefix=/home/shell/softwares/libpcap-1.9.0 && make && make install

# Install Nmap
RUN wget https://nmap.org/dist/nmap-7.80.tar.bz2 &&  bzip2 -cd nmap-7.80.tar.bz2 | tar xvf - && \
    cd nmap-7.80/ && ./configure \
    --prefix=/home/shell/softwares/nmap-7.80 \
    --with-libpcap=/home/shell/softwares/libpcap-1.9.0 && \
    make && make install

ENTRYPOINT ['/home/shell/softwares/nmap-7.80/bin/nmap']

CMD ['--help']
