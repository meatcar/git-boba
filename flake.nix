{
  description = "A more organized git-clone";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    gomod2nix.url = "github:nix-community/gomod2nix";
    gomod2nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      perSystem = { pkgs, inputs', ... }:
        let
          name = "git-boba";
        in
        {
          devShells.default = pkgs.mkShell {
            inherit name;
            buildInputs = with pkgs; [
              go
              gopls
              gotools
              go-tools

              inputs'.gomod2nix.packages.default
            ];
          };
          packages.default = inputs.gomod2nix.buildGoApplication {
            pname = name;
            version = self.rev;
            src = ./.;
            modules = ./gomod2nix.toml;
          };
        };
    };
}
