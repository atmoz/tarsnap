FROM debian:wheezy
MAINTAINER Adrian Dvergsdal [atmoz.net]

ENV TARSNAP_VERSION 1.0.36.1
ENV TARSNAP_SHA256 a2909e01e2f983179d63ef2094c42102c92c716032864e66ef25ae341ea28690

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
