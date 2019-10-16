FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD sources.list /etc/apt/sources.list
#COPY install-pkgs.sh /install-pkgs.sh
#RUN bash /install-pkgs.sh

RUN apt-get -y update
RUN apt-get install -y python-dev python3-pip python3-dev  python3.6-dev \
    build-essential libssl-dev libffi-dev \
     libxml2-dev libxslt1-dev zlib1g-dev net-tools libssh-gcrypt-dev \
	 libxml2-dev libpcap-dev net-tools nmap openssl

USER root
RUN pip3 install --upgrade pip --index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip3 install raccoon-scanner --index-url https://pypi.tuna.tsinghua.edu.cn/simple

#ENTRYPOINT ['raccoon']

CMD ['raccoon', '--help']


