{ hlint
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
  inherit hlint nixpkgs-fmt;
  protect-master = callPackage ./protect-master {};
}
