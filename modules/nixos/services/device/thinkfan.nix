{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.thinkfan.enable = lib.mkEnableOption ''
    Enable the Thinkfan fan control program.
  '';

  config = lib.mkIf config.thinkfan.enable {
    services.thinkfan = {
      enable = true;
      levels = [
        [
          0
          0
          55
        ]
        [
          1
          48
          60
        ]
        [
          2
          55
          70
        ]
        [
          3
          65
          90
        ]
      ];
    };
    boot.kernelParams = [
      "options"
      "thinkpad_acpi"
      "fan_control=1"
    ];
  };
}
