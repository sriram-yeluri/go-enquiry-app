FROM golang:1.19

WORKDIR /usr/src/app

COPY enquiry .
RUN go mod download && go mod verify && env GOOS=linux GOARCH=amd64 go build -v -o /usr/local/bin/enquiry ./...

EXPOSE 80

CMD ["enquiry"]