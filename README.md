# authorizer-proto-go

Generated protobuf/gRPC Go stubs for the [Authorizer](https://github.com/authorizerdev/authorizer)
auth server API (`authorizer.v1`).

This module is **generated code**, not meant for direct hand-editing. It is
consumed as a versioned dependency by
[`authorizer-go`](https://github.com/authorizerdev/authorizer-go) (and any other
Go client that speaks Authorizer's gRPC / grpc-gateway REST API). It replaces the
old approach of copy-pasting the stubs into each SDK.

## Usage

```go
import authorizerv1 "github.com/authorizerdev/authorizer-proto-go/authorizer/v1"
```

```bash
go get github.com/authorizerdev/authorizer-proto-go@latest
```

The package exposes the message types plus the gRPC client/server stubs for
`AuthorizerService` (public) and `AuthorizerAdminService` (admin). REST clients
(grpc-gateway JSON, `UseProtoNames: true` / snake_case) reuse the same message
structs via `protojson`.

## How it is generated

The stubs are generated directly from the published Buf Schema Registry module
[`buf.build/authorizerdev/authorizer`](https://buf.build/authorizerdev/authorizer)
— there is **no cross-repo copy step**. `google/api` and `buf/validate` imports
are resolved from their published Go modules (see `go.mod`), so only the
`authorizer/v1` package is vendored here.

```bash
make generate   # buf generate buf.build/authorizerdev/authorizer --template buf.gen.yaml
```

CI regenerates on demand (`Regenerate` workflow, `workflow_dispatch` or weekly
schedule) and opens a PR when the upstream schema has moved. Every push/PR is
build- and vet-verified.

## License

Apache-2.0. See [LICENSE](./LICENSE).
