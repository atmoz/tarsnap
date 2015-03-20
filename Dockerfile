FROM debian:wheezy
MAINTAINER Adrian Dvergsdal [atmoz.net]

ENV TARSNAP_VERSION 1.0.35
ENV TARSNAP_SHA256 6c9f6756bc43bc225b842f7e3a0ec7204e0cf606e10559d27704e1cc33098c9a

ENV TARSNAP_MAKE_PACKAGES \
    wget \
    ca-certificates \
    make \
    libssl-dev \
    zlib1g-dev \
    e2fslibs-dev

ENV TARSNAP_RUN_PACKAGES \
    openssl

COPY . /
RUN /install

VOLUME ["/tarsnap"]

CMD ["/bin/bash", "-c", "echo 'Available commands: ' && compgen -ca | grep tarsnap | sort"]
