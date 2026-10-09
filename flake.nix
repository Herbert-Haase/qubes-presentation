  ### flake.nix

    # nix develop
    # bun install
    # bun run dev
    # bun slidev build
    {
      description = "Slidev presentation with Bun";
    
      inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      };
    
      outputs = { self, nixpkgs }:
        let
          supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
          forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
            pkgs = import nixpkgs { inherit system; };
          });
        in
        {
          devShells = forEachSupportedSystem ({ pkgs }: {
            default = pkgs.mkShellNoCC {
              packages = with pkgs; [
                bun
                chromium
              ];

              shellHook = ''
                export PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH="${pkgs.chromium}/bin/chromium"
                export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
              '';
            };
          });
        };
    }
