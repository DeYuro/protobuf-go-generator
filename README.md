Protobuf -> go-gRPC pb generator

docker build --tag generator .
docker run -d -v $(pwd)/input:/input -v $(pwd)/output:/output --user $(id -u):$(id -g) generator