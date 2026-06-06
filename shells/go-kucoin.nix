{ pkgs }:

let
  private_repo = "bitbucket.kucoin.net";
in
pkgs.mkShell {
  packages = with pkgs; [
    just
    # zellij
    gnumake42
    go_1_25
    gotools
    gopls
    go-tools
    delve
    gdlv
    golangci-lint
    gofumpt
    grpcurl
    goctl
  ];

  shellHook = ''
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH

    go env -w GOPRIVATE="${private_repo}"
    go env -w GONOSUMDB="${private_repo}"

    if [ -d .git ]; then
      git config core.hooksPath .githooks
      echo "Git hooks configured: .githooks"
    fi

    echo "------ KuCoin development env loaded:"
    echo "--- go:     $(go version)"
    echo "--- goctl:  $(goctl --version)"
    echo "--- protoc: $(protoc --version) "
  '';
}
