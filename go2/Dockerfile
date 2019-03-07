FROM golang:1.11-alpine3.8
ENV GOOS=linux
ENV GOARCH=amd64
ENV CGO_ENABLED=0
RUN apk add --no-cache bash git make ca-certificates && update-ca-certificates
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
