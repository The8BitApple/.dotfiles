{ config, lib, pkgs, ... }:

{
  options.mangohud.enable = lib.mkEnableOption ''
    Enable and configure the Mangohud overlay.
  '';

  config = lib.mkIf config.mangohud.enable {
    programs.mangohud = {
      enable = true;
      settings = {
        horizontal = true;
        cpu_stats = true;
        cpu_temp = true;
        gpu_stats = true;
        gpu_temp = true;
        ram = true;
        vram = true;
        engine_short_names = true;
        engine_version = true;
        gamemode = true;
        gpu_core_clock = true;
        cpu_mhz = true;
        frame_timing = 1;
        fps_limit = 72;
      };
    };
  };
}
