{
  description = "Simple Python dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    python = pkgs.python311.withPackages (ps: with ps; [
      markdown
      beautifulsoup4
    ]);

  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = [
        python
        pkgs.cups
      ];

      shellHook = ''
        echo "🐍 Entered Python dev shell"
        trap 'echo "👋 Leaving Python dev shell"' EXIT
      '';
    };
  };
}
