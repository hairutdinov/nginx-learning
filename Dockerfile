FROM ubuntu:22.10

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

RUN wget https://nginx.org/download/nginx-1.23.2.tar.gz && \
    tar -zxvf nginx-1.23.2.tar.gz

RUN cd nginx-1.23.2 && \
    ./configure \
      --sbin-path=/usr/bin/nginx \
      --conf-path=/etc/nginx/nginx.conf \
      --error-log-path=/var/log/nginx/error.log \
      --http-log-path=/var/log/nginx/access.log \
      --with-pcre \
      --with-http_ssl_module \
      --pid-path=/var/run/nginx.pid && \
    make && \
    make install

WORKDIR /usr/share/nginx/html

CMD ["bash"]
