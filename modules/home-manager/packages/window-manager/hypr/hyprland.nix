{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

let
  startupScript = pkgs.writeShellApplication {
    name = "startup";
    runtimeInputs = with pkgs; [ waybar ];
    text = ''
      waybar &

      # Sleep to make sure that Hyprpaper socket is opened before wallpaper
      # script runs!
      sleep 3
      wall-time-of-day
    '';
  };
in
{
  options = {
    hyprland.enable = lib.mkEnableOption ''
      Configure the Hyprland window manager.
    '';
  };

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;

      settings = {

        exec-once = "${startupScript}/bin/startup";

        env = [ "LSP_USE_PLISTS,true" ];

        general = with config.colorScheme.palette; {
          border_size = 2;
          gaps_out = 10;
          layout = "master";

          "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base07})";
          "col.inactive_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base00})";
        };

        input = {
          kb_layout = "gb";
          kb_options = "caps:escape_shifted_capslock";

          follow_mouse = 1;
          mouse_refocus = true;

          touchpad = {
            natural_scroll = "no";
          };

          repeat_delay = 300;
          repeat_rate = 50;
        };

        decoration = {
          drop_shadow = false;
          rounding = 2;

          blur = {
            enabled = false;
            size = 2;
          };
        };

        xwayland.force_zero_scaling = true;

        "$mfact_split" = "0.55";
        master = {
          new_status = "master";
          new_on_top = true;
          mfact = "$mfact_split";
        };

        dwindle = {
          pseudotile = "yes";
          preserve_split = "yes";
        };

        gestures.workspace_swipe = "off";

        misc = {
          force_default_wallpaper = 0;

          enable_swallow = true;
          swallow_regex = "(Alacritty)";

          new_window_takes_over_fullscreen = 1;
          animate_manual_resizes = true;

          vrr = 1;
        };

        cursor = {
          inactive_timeout = 4;
        };

        "$animation_speed" = 2;
        animations = {
          enabled = "yes";
          bezier = "overshot, 0.05, 0.9, 0.1, 1.05";
        };

        animation = [
          "windows, 1, $animation_speed, overshot, popin 80%"
          "border, 1, $animation_speed, overshot"
          "fade, 1, $animation_speed, overshot"
          "workspaces, 1, $animation_speed, overshot, slide"
        ];

        windowrulev2 = [
          "float,title:(Authentication Required — PolicyKit1 KDE Agent)$"
          "float,title:^(File Operation Progress)$"
          "noanim,class:^(Gimp)$"
          "stayfocused, title:^()$,class:^(steam)$"
          "minsize 1 1, title:^()$,class:^(steam)$"
        ];

        layerrule = [
          "blur, launcher"
          "blur, notifications"
        ];

        "$mod" = "SUPER";

        bind = [

          "$mod, Q, killactive"
          "$mod, F, fullscreen, 0"

          "$mod SHIFT, Space, togglefloating"
          "$mod SHIFT, Space, resizeactive, exact 50% 50%"
          "$mod SHIFT, Space, centerwindow, 1"

          "$mod CTRL, Space, togglefloating"
          "$mod CTRL, Space, resizeactive, exact 33% 33%"
          "$mod CTRL, Space, movewindow, d"
          "$mod CTRL, Space, movewindow, r"
          "$mod CTRL, Space, pin"

          "$mod, Return, exec, alacritty"

          "$mod, P, exec, alacritty -e pulsemixer"

          "$mod SHIFT, R, exec, alacritty -e htop"

          "$mod, X, exec, emc"
          "$mod SHIFT, X, exec, emc -r"
          "$mod, W, exec, firefox"
          "$mod CTRL, W, exec, brave"

          "$mod, E, exec, Thunar"

          "$mod, R, exec, tofi-run | xargs hyprctl dispatch exec --"
          "$mod CTRL, L, exec, physlock -m -s"

          "$mod, C, exec, screenshot"
          "$mod, V, exec, img-edit"

          "$mod, B, exec, pkill -SIGUSR1 waybar"

          "$mod, M, exit,"
          "$mod, Backspace, exec, sysact"

          "$mod CTRL, H, exec, changevolume mute"
          ", XF86AudioMute, exec, changevolume mute"

          ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"

          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"

          "$mod SHIFT, 1, movetoworkspacesilent, 1"
          "$mod SHIFT, 2, movetoworkspacesilent, 2"
          "$mod SHIFT, 3, movetoworkspacesilent, 3"
          "$mod SHIFT, 4, movetoworkspacesilent, 4"
          "$mod SHIFT, 5, movetoworkspacesilent, 5"
          "$mod SHIFT, 6, movetoworkspacesilent, 6"
          "$mod SHIFT, 7, movetoworkspacesilent, 7"
          "$mod SHIFT, 8, movetoworkspacesilent, 8"
          "$mod SHIFT, 9, movetoworkspacesilent, 9"
          "$mod SHIFT, 0, movetoworkspacesilent, 10"

          "$mod, J, layoutmsg, cyclenext"
          "$mod, K, layoutmsg, cycleprev"

          "$mod SHIFT, J, layoutmsg, swapnext"
          "$mod SHIFT, K, layoutmsg, swapprev"

          "$mod, Space, layoutmsg, swapwithmaster"
          "$mod SHIFT, F, layoutmsg, focusmaster"

          "$mod, I, layoutmsg, orientationcenter"

          "$mod, T, layoutmsg, orientationleft"
        ];

        binde = [

          "$mod CTRL, K, exec, changevolume up 5"
          ", XF86AudioRaiseVolume, exec, changevolume up 5"

          "$mod CTRL, J, exec, changevolume down 5"
          ", XF86AudioLowerVolume, exec, changevolume down 5"

          "$mod, L, resizeactive, 25 0"
          "$mod, H, resizeactive, -25 0"
        ];

        bindm = [

          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
      };
    };
  };
}
