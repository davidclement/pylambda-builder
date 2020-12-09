FROM amazonlinux:latest

RUN yum install -y python3 && \
    pip3 install --upgrade pip && \
    yum install -y zip  

RUN mkdir -p /build/install && \
    mkdir -p /src/function_code
WORKDIR /build

COPY package_code.sh package_code.sh
RUN chmod 777 package_code.sh

CMD /build/package_code.sh
