{ sources ? import ./sources.nix
, system ? builtins.currentSystem
}:

let
  overlay =
    _: pkgs:
      {
        inherit (pkgs) niv ormolu nixpkgs-fmt;
        packages = pkgs.callPackages ./packages.nix {};
      };
in
import sources.nixpkgs {
  overlays = [ overlay ];
  config = {};
  inherit system;
}
