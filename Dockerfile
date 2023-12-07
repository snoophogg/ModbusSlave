FROM scratch AS base
WORKDIR /app

FROM debian:bullseye-slim as build
WORKDIR /app
ADD https://www.modbusdriver.com/downloads/diagslave.tgz /tmp/diagslave.tgz
RUN case "${TARGETPLATFORM}" in \
         "linux/amd64")  TARGET_DIR=x86_64-linux-gnu  ;; \
         "linux/arm64")  TARGET_DIR=aarch64-linux-gnu  ;; \
         "linux/arm/v7")  TARGET_DIR=arm-linux-gnueabihf  ;; \
         *) TARGET_DIR=x86_64-linux-gnu ;; \
    esac; \
    tar xzf /tmp/diagslave.tgz --strip-components 2 -C /app diagslave/$TARGET_DIR/diagslave

FROM base AS final
EXPOSE 502/tcp
EXPOSE 502/udp
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT [ "/app/diagslave" ]