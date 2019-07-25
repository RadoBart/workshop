FROM golang:1.12 as builder

WORKDIR /app
COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /build/server .

FROM alpine:latest

RUN apk update && \
    apk add ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

COPY --from=builder /build /app

WORKDIR /app

EXPOSE 80

ENTRYPOINT ["/app/server"]