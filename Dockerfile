FROM debian:wheezy
MAINTAINER Adrian Dvergsdal [atmoz.net]

ENV TARSNAP_VERSION 1.0.37
ENV TARSNAP_SHA256 fa999413651b3bd994547a10ffe3127b4a85a88b1b9a253f2de798888718dbfa

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
