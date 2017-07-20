FROM debian:wheezy
MAINTAINER Adrian Dvergsdal [atmoz.net]

ENV TARSNAP_VERSION 1.0.38
ENV TARSNAP_SHA256 76ee0c18baa54c11729d12aa91476abccae140549def5a604010e1138538cd5b

ENV TARSNAP_MAKE_PACKAGES \
    wget \
    ca-certificates \
    make \
    libssl-dev \
    zlib1g-dev \
    e2fslibs-dev

ENV TARSNAP_RUN_PACKAGES \
    locales \
    openssl

COPY . /
RUN /install

ENV LANG     en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL   en_US.UTF-8

VOLUME ["/tarsnap"]

CMD ["/bin/bash", "-c", "echo 'Available commands: ' && compgen -ca | grep tarsnap | sort"]
