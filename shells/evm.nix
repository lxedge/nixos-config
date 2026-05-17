{ pkgs }:

pkgs.mkShell {
  name = "evm-dev-env";

  buildInputs =
    with pkgs;
    [
      nodejs_24
      typescript
      typescript-language-server
      prettier
      eslint
      pnpm
      yarn
      solc
      vscode-solidity-server
      foundry
    ]
    ++ (
      if stdenv.isDarwin then
        [
          libiconv
          darwin.apple_sdk.frameworks.Security
          darwin.apple_sdk.frameworks.SystemConfiguration
        ]
      else
        [ ]
    );

  shellHook = ''
    echo "------ EVM development env loaded:"
    echo "--- node   $(node -v)"
    echo "--- npm    $(npm -v)"
    echo "--- pnpm   $(pnpm -v)"
    echo "--- yarn   $(yarn -v)"
    echo "--- tsc    $(tsc -v)"
    echo "--- solc   $(solc --version)"
    echo "--- forge  $(forge --version)"
  '';
}
