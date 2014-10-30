FROM debian:wheezy
MAINTAINER Adrian Dvergsdal [atmoz.net]

ENV TARSNAP_VERSION 1.0.35

ENV TARSNAP_MAKE_PACKAGES \
    wget \
    ca-certificates \
    make \
    libssl-dev \
    zlib1g-dev \
    e2fslibs-dev

ENV TARSNAP_RUN_PACKAGES \
    openssl

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install $TARSNAP_RUN_PACKAGES $TARSNAP_MAKE_PACKAGES && \
    \
    cd /root && \
    wget -O - https://www.tarsnap.com/download/tarsnap-autoconf-$TARSNAP_VERSION.tgz | tar zxf - && \
    cd tarsnap-autoconf-$TARSNAP_VERSION && \
    ./configure && \
    make all install clean && \
    cd .. && \
    rm -R tarsnap-autoconf-$TARSNAP_VERSION && \
    \
    DEBIAN_FRONTEND=noninteractive apt-get -y remove --purge $TARSNAP_MAKE_PACKAGES && \
    DEBIAN_FRONTEND=noninteractive apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN useradd --system --user-group --home-dir /tarsnap tarsnap && \
    mkdir /tarsnap && \
    touch /tarsnap/.not-empty && \
    chown -R tarsnap:tarsnap /tarsnap

WORKDIR /tarsnap
USER tarsnap

VOLUME ["/tarsnap"]

CMD ["/bin/bash", "-c", "echo 'Available commands: ' && compgen -ca | grep tarsnap | sort"]
