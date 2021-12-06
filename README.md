# Protobuf -> golang grpc *pb files converter

---

## How to use
```
git submodule update --init
docker build --tag generator .
docker run -d -v $(pwd)/input:/input -v $(pwd)/output:/output --user $(id -u):$(id -g) generator
```

***

> ## About docker flags
>-v $(pwd)/input:/input - mount folder with **API**
>
>-v $(pwd)/output:/output - mount folder for **generated files** 
>
>--user $(id -u):$(id -g) run from current user. This prevent for generated files from **root** user

The example api in the submodules deliberately does not have `options go_package` , it will be generated in the process without changing the source file. 
If the **proto file** has `options go_package`, then there will be no changes for it. However, if there are files with `options go_package` and without it at the same level, this will entail the generation of files in the same directory with different packages name.


> ## NOTE:
> 
> It is assumed that the API has a valid structure, even if the guidelines are violated 
>
> Anyway there is a chance that even valid imports will be not found for --proto_path (-I)
> 
> It can be checked by run command manually `protoc -I/usr/local/include -I$(pwd)/input --go_out=$(pwd)/output --go-grpc_out=$(pwd)/output --go_opt=paths=source_relative --go-grpc_opt=paths=source_relative stubproto/proto/v1/baz.proto stubproto/proto/v1/structures.proto stubproto/proto/v1/foo.proto`
> 
> And after researching made changes into `assets/generator.go:58` by you own
