FROM centos:latest

RUN yum install -y autoconf automake gcc git libcurl-devel make && \
    git clone https://github.com/wolf9466/cpuminer-multi && \
    cd cpuminer-multi && ./autogen.sh && CFLAGS="-march=native -O3" ./configure && make && \
    yum clean all

WORKDIR	/cpuminer-multi
ENTRYPOINT ["./minerd"]