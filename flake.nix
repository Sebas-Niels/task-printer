{
  description = "Simple Python dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux"; # change if needed
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default =
        pkgs.mkShell {
          packages = [
            pkgs.python312
            pkgs.python312Packages.pip
            pkgs.python312Packages.virtualenv
          ];

            shellHook = ''
                echo "🐍 Entered Python dev shell"
                trap 'echo "👋 Leaving Python dev shell"' EXIT
            '';
        };
    };
}
