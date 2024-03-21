FROM golang:alpine as building
WORKDIR /usr/src/app
COPY . .

ENV PORT=8080
ENV REQUEST_ORIGIN='http://localhost:5000'
RUN go build && go test ./...


FROM scratch
WORKDIR /usr/src/app
COPY --from=building /usr/src/app/server /usr/src/app/server

EXPOSE 8080
CMD ["./server"]