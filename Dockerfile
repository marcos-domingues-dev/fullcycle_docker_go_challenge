# Stage 01 - Download and build project
FROM golang:1.19 AS go_builder
WORKDIR /usr/src/app
RUN git clone https://github.com/marcos-domingues-dev/fullcycle_go_challenge.git /usr/src/app
RUN go build

# Stage 02 - Build app container
FROM scratch
WORKDIR /usr/src/app
COPY --from=go_builder /usr/src/app .
CMD ["./fullcycle"]
