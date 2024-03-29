# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
    foundry.url = "github:ZePedroResende/foundry.nix";
  };

  outputs = { self, nixpkgs, utils, foundry }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ foundry.overlay ];
        };
      in {

        devShell = with pkgs; mkShell {
          buildInputs = [
            # From the foundry overlay
            # Note: Can also be referenced without overlaying as: foundry.defaultPackage.${system}
            foundry-bin

            # ... any other dependencies we need
            (python3.withPackages(ps: with ps; [
               ipython
               jupyter
               matplotlib
               numpy
               pandas
            ]))
            yarn
            nodejs-16_x
          ];

          # Decorative prompt override so we know when we're in a dev shell
          shellHook = ''
            export PS1="\e[1;33m\][dev]\e[1;34m\] \w $ \e[0m\]"
          '';
        };
      });
}
