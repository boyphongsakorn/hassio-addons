FROM ubuntu:bionic
#ARG BUILD_FROM
#FROM $BUILD_FROM
ARG BUILD_ARCH
RUN mkdir /app
WORKDIR '/app'
#RUN apt-get update
#RUN apt-get install ca-certificates -y
#RUN update-ca-certificates
COPY . /app
RUN \
    ARCH="${BUILD_ARCH}" \
    && if [[ "${BUILD_ARCH}" = "aarch64" ]]; then ARCH="aarch64"; fi \
    && if [[ "${BUILD_ARCH}" = "amd64" ]]; then ARCH="linux_64"; fi \
    && if [[ "${BUILD_ARCH}" = "armhf" ]]; then ARCH="aarch64"; fi \
    && if [[ "${BUILD_ARCH}" = "armv7" ]]; then ARCH="armv7"; fi \
    && if [[ "${BUILD_ARCH}" = "i386" ]]; then ARCH="aarch64"; fi \
    && apk add --no-cache libc6-compat yq \
    && wget -O /app/playit https://playit.gg/downloads/playit-$ARCH-0.4.6
RUN chmod 0755 /app/playit
CMD /app/playit