FROM docker
WORKDIR /usr/src/app/
COPY builder.sh .
RUN apk update; apk add git; apk add --no-cache bash

ENTRYPOINT ["/usr/src/app/builder.sh"]
