FROM amazonlinux:latest

RUN yum install -y python37 && \
    pip3 install --upgrade pip && \
    yum install -y zip  

RUN mkdir -p /build/install && \
    mkdir -p /src/function_code
WORKDIR /build

COPY build.sh build.sh
RUN chmod 777 build.sh 

CMD /build/build.sh
