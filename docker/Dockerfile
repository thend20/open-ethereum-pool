FROM ubuntu:16.04
RUN apt-get update && apt-get -y install curl software-properties-common && curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN add-apt-repository ppa:longsleep/golang-backports && apt-get update && apt-get -y install build-essential golang-go nodejs git

RUN git config --global http.https://gopkg.in.followRedirects true

WORKDIR /opt

RUN git clone https://github.com/ethereum/go-ethereum.git

WORKDIR /opt/go-ethereum

RUN make geth

RUN chmod a+x /opt/go-ethereum/build/bin/geth
RUN ln -s /opt/go-ethereum/build/bin/geth /usr/bin/geth

WORKDIR /opt

RUN git config --global http.https://gopkg.in.followRedirects true
RUN git clone --branch release/music --single-branch https://github.com/bulktrade/open-ethereum-pool.git

WORKDIR /opt/open-ethereum-pool

RUN make

WORKDIR /opt/open-ethereum-pool/www

RUN npm install -g ember-cli@2.9.1 bower && npm install && bower --allow-root install && ./build.sh

WORKDIR /

RUN apt-get update && apt-get -y install nginx
RUN apt-get update && apt-get -y install supervisor python-pip net-tools && pip install supervisor-stdout

ENV DEBIAN_FRONTEND noninteractive

COPY nginx.conf /etc/nginx/sites-enabled/default
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY pool.conf /etc/security/limits.d/pool.conf
COPY payouts.sh /payouts.sh
COPY pool.sh /pool.sh
COPY geth.sh /geth.sh

RUN chmod a+x /payouts.sh && chmod a+x /pool.sh && chmod a+x /geth.sh

CMD ["/usr/bin/supervisord"]

VOLUME ["/root/.musicoin"]

EXPOSE 8008 8088 80
