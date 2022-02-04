FROM ubuntu:bionic
#ARG BUILD_FROM
#FROM $BUILD_FROM
#ARG BUILD_ARCH
RUN mkdir /app
WORKDIR '/app'
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates
RUN update-ca-certificates
COPY . /app
RUN \
    ARCH="" \
    && if [[ `uname -m` = "aarch64" ]]; then ARCH="aarch64"; fi \
    && if [[ `uname -m` = "x86_64" ]]; then ARCH="linux_64"; fi \
    && if [[ `uname -m` = "armhf" ]]; then ARCH="aarch64"; fi \
    && if [[ `uname -m` = "armv7l" ]]; then ARCH="armv7"; fi \
    && if [[ `uname -m` = "ppc64le" ]]; then ARCH="aarch64"; fi \
    && wget -O /app/playit https://playit.gg/downloads/playit-$ARCH-0.4.6
RUN chmod 0755 /app/playit
CMD /app/playit