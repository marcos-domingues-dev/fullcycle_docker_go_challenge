# Stage - 01 (LOCAL)
FROM golang:1.19 AS go_builder
WORKDIR /usr/src/app
COPY . .
RUN go build

# Stage 02 - Build app container
FROM scratch
WORKDIR /usr/src/app
COPY --from=go_builder /usr/src/app .
CMD ["./fullcycle"]
