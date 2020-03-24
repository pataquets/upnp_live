FROM gcc

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      libupnp-dev \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

COPY . /usr/src/app/
WORKDIR /usr/src/app/

RUN \
  make && \
  mv -v ./upnp_live /usr/bin/ && \
  make clean

ENTRYPOINT [ "upnp_live" ]
