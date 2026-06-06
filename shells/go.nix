{ pkgs }:

pkgs.mkShell {
  name = "go-dev-env";

  buildInputs = with pkgs; [
    go
    gotools
    gopls
    delve
    gdlv
    golangci-lint
    gofumpt
    grpcurl
    goctl
    air
    protobuf
    protoc-gen-doc
    protoc-gen-go
    protoc-gen-go-grpc
  ];

  shellHook = ''
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH

    echo "------ Go development env loaded:"
    echo "--- go:     $(go version)"
    echo "--- goctl:  $(goctl --version)"
    echo "--- protoc: $(protoc --version)"
    echo "------ Go development env loaded."
  '';
}
