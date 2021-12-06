FROM golang:1.17

# Common
RUN : \
    && apt-get update -y \
    && mkdir /input \
    && mkdir -p /home/generator \
    && chmod 777 /home/generator


# Install protobuf compiler
RUN : \
    && apt-get install protobuf-compiler -y;

#  Copy asserts
COPY assets/include /usr/local/include
COPY assets/generator.go /go/src/generator/

# Install protoc-gen-go and protoc-gen-go-grpc
RUN : \
    && go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26 \
    && go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1

# Install generator
RUN : \
    && cd src/generator \
    && go mod init \
    && go install

ENTRYPOINT ["generator"]