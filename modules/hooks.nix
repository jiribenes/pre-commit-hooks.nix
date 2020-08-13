{ config, lib, pkgs, ... }:
let
  inherit (config.pre-commit) tools settings;
  inherit (lib) mkOption types;
in
{
  options.pre-commit.settings =
    {
    };
  config.pre-commit.hooks =
    {
      hlint =
        {
          name = "hlint";
          description =
            "HLint gives suggestions on how to improve your source code.";
          entry = "${tools.hlint}/bin/hlint";
          files = "\\.l?hs$";
        };
      nixpkgs-fmt =
        {
          name = "nixpkgs-fmt";
          description = "Nix code prettifier.";
          entry = "${tools.nixpkgs-fmt}/bin/nixpkgs-fmt";
          files = "\\.nix$";
        };
      protect-master =
        {
          name = "protect-master";
          description = "Protects the master branch from unwanted commits";
          entry = "${tools.protect-master}/bin/protect-master";
          pass_filenames = false;
        };
    };
}
