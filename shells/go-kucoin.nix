{ pkgs }:

let
  private_repo = "bitbucket.kucoin.net";

  go_1_24_6 = pkgs.go_1_24.overrideAttrs (_: rec {
    version = "1.24.6";
    src = pkgs.fetchurl {
      url = "https://go.dev/dl/go${version}.src.tar.gz";
      hash = "sha256-4ctVgqq1iGaLwEwH3hhogHD2uMmyqvNh+CHhm9R8/b0=";
    };
  });
in
pkgs.mkShell {
  packages = with pkgs; [
    just
    zellij
    gnumake42
    go_1_24_6
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

  shell = "${pkgs.zsh}/bin/zsh";

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
