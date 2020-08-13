{ sources ? import ./sources.nix
, system ? builtins.currentSystem
}:

let
  overlay =
    _: pkgs:
      {
        inherit (pkgs) niv nixpkgs-fmt;
        packages = pkgs.callPackages ./packages.nix {};
      };
in
import sources.nixpkgs {
  overlays = [ overlay ];
  config = {};
  inherit system;
}
