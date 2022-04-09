FROM --platform=amd64 golang:alpine as builder
WORKDIR /app
COPY go.mod go.sum  /app/
RUN go mod download
COPY ./*.go .
RUN go build -o app

FROM --platform=amd64 alpine as prod
WORKDIR /app
COPY --from=builder /app/app/ /app
CMD [ "/app/app" ]
