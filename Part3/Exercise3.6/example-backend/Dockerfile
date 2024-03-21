FROM golang:alpine

WORKDIR /usr/src/app
EXPOSE 8080

COPY . .

ENV PORT=8080
ENV REQUEST_ORIGIN='http://localhost:5000'

RUN go build && go test ./... && adduser --disabled-password appuser

USER appuser

CMD ["./server"]