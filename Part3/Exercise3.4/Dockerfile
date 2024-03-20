FROM ubuntu AS builder
RUN apt-get update; apt-get -y install git;

FROM docker
WORKDIR /usr/src/app
COPY --from=builder /bin /bin
COPY --from=builder /boot /boot
COPY builder.sh .

ENTRYPOINT ["/usr/src/app/builder.sh"]
