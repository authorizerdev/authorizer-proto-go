.PHONY: generate build vet tidy verify

# Regenerate the authorizer/v1 stubs straight from the published BSR module.
# No cross-repo copy step: the schema is pulled from buf.build/authorizerdev/authorizer.
generate:
	rm -rf authorizer
	buf generate buf.build/authorizerdev/authorizer --template buf.gen.yaml
	go mod tidy

build:
	go build ./...

vet:
	go vet ./...

tidy:
	go mod tidy

# Local equivalent of CI: regenerate, tidy, build, vet, and fail if the
# committed output drifted from what BSR currently produces.
verify: generate build vet
	git diff --exit-code || (echo "generated output is stale; commit the regenerated stubs" && exit 1)
