{ pkgs }:

let
  privateRepo = "bitbucket.kucoin.net";
in
pkgs.mkShell {
  shellHook = ''
    if command -v go >/dev/null 2>&1; then
      go env -w GOPRIVATE="${privateRepo}"
      go env -w GONOSUMDB="${privateRepo}"
    fi
  '';
}
