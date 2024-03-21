FROM golang:1.16
WORKDIR /usr/src/app
EXPOSE 8080

COPY . .

ENV PORT=8080
ENV REQUEST_ORIGIN='http://localhost:5000'

RUN go build
RUN go test ./...

RUN adduser appuser
USER appuser

CMD ["./server"]