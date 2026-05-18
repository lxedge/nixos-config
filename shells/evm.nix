{ pkgs, solc }:

pkgs.mkShell {
  name = "evm-dev-env";

  buildInputs = with pkgs; [
    nodejs_24
    typescript
    typescript-language-server
    prettier
    eslint
    pnpm
    yarn
    solc_0_8_17
    # solc-select
    vscode-solidity-server
    foundry

    (solc.mkDefault pkgs solc_0_8_17)
  ];

  shellHook = ''
    echo "------ EVM development env loaded:"
    echo "--- node:  $(node -v)"
    echo "--- npm:   $(npm -v)"
    echo "--- pnpm:  $(pnpm -v)"
    echo "--- yarn:  $(yarn -v)"
    echo "--- tsc:   $(tsc -v)"
    echo "--- solc:  $(solc --version)"
    echo "--- forge: $(forge --version)"
  '';
}
