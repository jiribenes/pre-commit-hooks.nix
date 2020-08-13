{ haskellPackages
, hlint
, ormolu
, niv
, gitAndTools
, runCommand
, writeText
, writeScript
, git
, nixpkgs-fmt
, callPackage
}:

{
  inherit hlint ormolu nixpkgs-fmt;
  inherit (haskellPackages) brittany;
  protect-master = callPackage ./protect-master {};
}
