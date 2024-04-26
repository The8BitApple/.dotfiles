{ pkgs, lib, config, ... }:

{
  options.screenshot.enable = lib.mkEnableOption ''
    Enable script to screenshot portions of the screen.
  '';

  config = lib.mkIf config.screenshot.enable {
    home.packages = with pkgs;
      [
        (pkgs.writeShellApplication {
          name = "screenshot";
          runtimeInputs = with pkgs; [ grim slurp imagemagick wl-clipboard ];
          text = ''
            grim -g "$(slurp)" - | convert - -shave 1x1 PNG:- | wl-copy
          '';
        })
      ];
  };
}
