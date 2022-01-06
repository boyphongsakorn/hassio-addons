ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG RUNARCH
RUN \
    CVERSION="latest/download" \
    && if [[ "${BUILD_ARCH}" = "aarch64" ]]; then RUNARCH="arm64"; fi \
    && if [[ "${BUILD_ARCH}" = "amd64" ]]; then RUNARCH="amd64"; fi \
    && if [[ "${BUILD_ARCH}" = "armhf" ]]; then RUNARCH="arm"; fi \
    && if [[ "${BUILD_ARCH}" = "armv7" ]]; then RUNARCH="arm"; fi \
    && if [[ "${BUILD_ARCH}" = "i386" ]]; then RUNARCH="386"; fi \
    && apk add --no-cache libc6-compat yq \
    && wget -O /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/$CVERSION/cloudflared-linux-$RUNARCH && chmod +x /usr/local/bin/cloudflared

ENV TZ="Asia/Bangkok"
ENV CVERSION="latest/download"
ENV ARCH=$RUNARCH

RUN cloudflared -v

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]