{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  options.dsda-doom.enable = lib.mkEnableOption ''
    Install and configure dsda-doom.
  '';

  config = lib.mkIf config.dsda-doom.enable {
    home.packages = with pkgs; [
      dsda-doom
      dsda-launcher
    ];

    home.file.".dsda-doom/dsda-doom.cfg".text = ''
      # Doom config file
      # Format:
      # variable   value

      # System settings
      process_priority                0

      # Misc settings
      vanilla_keymap                  0
      menu_background                 0
      max_player_corpse               32
      flashing_hom                    0
      demo_smoothturns                0
      demo_smoothturnsfactor          6
      screenshot_dir                  ""
      startup_delay_ms                0
      ansi_endoom                     0
      announce_map                    1

      # Game settings
      default_compatibility_level     3
      default_skill                   3
      weapon_attack_alignment         0
      sts_always_red                  1
      sts_pct_always_gray             0
      sts_traditional_keys            0
      show_messages                   1
      autorun                         1
      deh_apply_cheats                1
      movement_strafe50               0
      movement_strafe50onturns        0
      movement_shorttics              0

      # Sound settings
      pitched_sounds                  0
      full_sounds                     1
      snd_samplerate                  44100
      snd_samplecount                 0
      sfx_volume                      15
      music_volume                    15
      mus_pause_opt                   1
      snd_channels                    32
      snd_midiplayer                  "fluidsynth"
      snd_mididev                     ""
      snd_soundfont                   "/home/${userSettings.username}/.local/share/soundfonts/SC-55.SoundFont.v1.2b.sf2"
      mus_fluidsynth_chorus           0
      mus_fluidsynth_reverb           0
      mus_fluidsynth_gain             50
      mus_fluidsynth_chorus_depth     500
      mus_fluidsynth_chorus_level     35
      mus_fluidsynth_reverb_damp      40
      mus_fluidsynth_reverb_level     15
      mus_fluidsynth_reverb_width     400
      mus_fluidsynth_reverb_room_size 60
      mus_opl_gain                    50
      mus_opl_opl3mode                1
      mus_portmidi_reset_type         "gm"
      mus_portmidi_reset_delay        0
      mus_portmidi_filter_sysex       1
      mus_portmidi_reverb_level       40
      mus_portmidi_chorus_level       0

      # Video settings
      videomode                       "OpenGL"
      screen_resolution               "1920x1080"
      custom_resolution               ""
      use_fullscreen                  1
      exclusive_fullscreen            1
      render_vsync                    0
      uncapped_framerate              1
      boom_translucent_sprites        1
      screenblocks                    10
      usegamma                        0
      dsda_fps_limit                  72
      sdl_video_window_pos            "center"
      palette_ondamage                1
      palette_onbonus                 1
      palette_onpowers                1
      render_wipescreen               1
      render_screen_multiply          1
      integer_scaling                 0
      render_aspect                   0
      render_doom_lightmaps           0
      fake_contrast_mode              1
      render_stretch_hud              1
      render_patches_scalex           0
      render_patches_scaley           0
      render_stretchsky               1
      allow_freelook                  0

      # OpenGL settings
      gl_render_multisampling         8
      gl_render_fov                   120
      gl_skymode                      0
      gl_health_bar                   0
      gl_usevbo                       1
      gl_fade_mode                    0

      # Mouse settings
      use_mouse                       1
      mouse_stutter_correction        1
      mouse_sensitivity_horiz         10
      dsda_fine_sensitivity           0
      mouse_sensitivity_vert          1
      dsda_mouse_acceleration         10
      mouse_sensitivity_mlook         10
      mouse_doubleclick_as_use        0
      mouse_carrytics                 1
      movement_vertmouse              0
      movement_mousestrafedivisor     4
      movement_mouseinvert            0

      # Game controller settings
      use_game_controller             0
      left_analog_deadzone            2000
      right_analog_deadzone           2000
      left_trigger_deadzone           1
      right_trigger_deadzone          1
      left_analog_sensitivity_x       100
      left_analog_sensitivity_y       100
      right_analog_sensitivity_x      1536
      right_analog_sensitivity_y      768
      analog_look_acceleration        0
      swap_analogs                    0
      invert_analog_look              0

      # Automap settings
      mapcolor_back                   247
      mapcolor_grid                   104
      mapcolor_wall                   252
      mapcolor_fchg                   55
      mapcolor_cchg                   215
      mapcolor_clsd                   208
      mapcolor_rkey                   175
      mapcolor_bkey                   204
      mapcolor_ykey                   231
      mapcolor_rdor                   175
      mapcolor_bdor                   204
      mapcolor_ydor                   231
      mapcolor_tele                   119
      mapcolor_secr                   252
      mapcolor_revsecr                112
      mapcolor_exit                   0
      mapcolor_unsn                   104
      mapcolor_flat                   88
      mapcolor_sprt                   112
      mapcolor_item                   231
      mapcolor_hair                   208
      mapcolor_sngl                   208
      mapcolor_me                     112
      mapcolor_enemy                  177
      mapcolor_frnd                   112
      map_blinking_locks              1
      map_secret_after                0
      map_coordinates                 1
      map_totals                      1
      map_time                        1
      map_title                       1
      automap_overlay                 1
      automap_rotate                  0
      automap_follow                  1
      automap_grid                    0
      map_grid_size                   128
      map_scroll_speed                32
      map_wheel_zoom                  1
      map_use_multisampling           0
      map_textured                    0
      map_textured_trans              0
      map_textured_overlay_trans      66
      map_lines_overlay_trans         100
      map_things_appearance           2

      # Heads-up display settings
      hud_health_red                  25
      hud_health_yellow               50
      hud_health_green                100
      hud_ammo_red                    25
      hud_ammo_yellow                 50
      hud_displayed                   1
      hudadd_secretarea               1
      hudadd_demoprogressbar          1
      hudadd_crosshair                0
      hudadd_crosshair_scale          0
      hudadd_crosshair_color          3
      hudadd_crosshair_health         0
      hudadd_crosshair_target         0
      hudadd_crosshair_target_color   9
      hudadd_crosshair_lock_target    0

      # DSDA-Doom settings
      dsda_strict_mode                1
      dsda_cycle_ghost_colors         0
      dsda_auto_key_frame_interval    1
      dsda_auto_key_frame_depth       60
      dsda_auto_key_frame_timeout     10
      dsda_exhud                      0
      ex_text_scale_x                 0
      ex_text_ratio_y                 0
      dsda_free_text                  ""
      dsda_wipe_at_full_speed         1
      dsda_show_demo_attempts         1
      dsda_hide_horns                 0
      dsda_hide_weapon                0
      dsda_organized_saves            1
      dsda_command_display            0
      dsda_command_history_size       10
      dsda_hide_empty_commands        1
      dsda_coordinate_display         0
      dsda_show_fps                   0
      dsda_show_minimap               0
      dsda_show_level_splits          1
      dsda_skip_quit_prompt           0
      dsda_show_split_data            1
      dsda_player_name                "Anonymous"
      dsda_quickstart_cache_tics      0
      dsda_death_use_action           0
      dsda_mute_sfx                   0
      dsda_mute_music                 0
      dsda_cheat_codes                1
      dsda_allow_jumping              0
      dsda_parallel_sfx_limit         0
      dsda_parallel_sfx_window        1
      dsda_movement_toggle_sfx        0
      dsda_switch_when_ammo_runs_out  1
      dsda_viewbob                    1
      dsda_weaponbob                  1
      dsda_quake_intensity            100
      dsda_organize_failed_demos      0

      # Scripts
      dsda_script_0                   ""
      dsda_script_1                   ""
      dsda_script_2                   ""
      dsda_script_3                   ""
      dsda_script_4                   ""
      dsda_script_5                   ""
      dsda_script_6                   ""
      dsda_script_7                   ""
      dsda_script_8                   ""
      dsda_script_9                   ""

      # Video capture encoding settings
      cap_soundcommand                "ffmpeg -f s16le -ar %s -ac 2 -i - -c:a libopus -y temp_a.nut"
      cap_videocommand                "ffmpeg -f rawvideo -pix_fmt rgb24 -r %r -s %wx%h -i - -c:v libx264 -y temp_v.nut"
      cap_muxcommand                  "ffmpeg -i temp_v.nut -i temp_a.nut -c copy -y %f"
      cap_tempfile1                   "temp_a.nut"
      cap_tempfile2                   "temp_v.nut"
      cap_remove_tempfiles            1
      cap_wipescreen                  0
      cap_fps                         60

      # Overrun settings
      overrun_spechit_warn            0
      overrun_spechit_emulate         1
      overrun_reject_warn             0
      overrun_reject_emulate          1
      overrun_intercept_warn          0
      overrun_intercept_emulate       1
      overrun_playeringame_warn       0
      overrun_playeringame_emulate    1
      overrun_donut_warn              0
      overrun_donut_emulate           0
      overrun_missedbackside_warn     0
      overrun_missedbackside_emulate  0

      # Mapping error compatibility settings
      comperr_passuse                 0
      comperr_hangsolid               0
      comperr_blockmap                0
      comperr_freeaim                 0

      # Weapon preferences
      weapon_choice_1                 6
      weapon_choice_2                 9
      weapon_choice_3                 4
      weapon_choice_4                 3
      weapon_choice_5                 2
      weapon_choice_6                 8
      weapon_choice_7                 5
      weapon_choice_8                 7
      weapon_choice_9                 1

      # Input settings
      input_profile                   0

      input_forward                   119 2 -1 | 119 2 -1 | 119 2 -1
      input_backward                  115 -1 -1 | 115 -1 -1 | 115 -1 -1
      input_turnleft                  0 -1 -1 | 101 -1 -1 | 101 -1 -1
      input_turnright                 0 -1 -1 | 113 -1 -1 | 113 -1 -1
      input_speed                     0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_strafeleft                97 -1 -1 | 97 -1 -1 | 97 -1 -1
      input_straferight               100 -1 -1 | 100 -1 -1 | 100 -1 -1
      input_strafe                    0 1 9 | 0 1 9 | 0 1 9
      input_autorun                   186 -1 7 | 186 -1 7 | 186 -1 7
      input_reverse                   47 -1 8 | 47 -1 8 | 47 -1 8
      input_use                       32 -1 0 | 32 -1 0 | 32 -1 0
      input_flyup                     46 -1 11 | 46 -1 11 | 46 -1 11
      input_flydown                   44 -1 12 | 44 -1 12 | 44 -1 12
      input_flycenter                 0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_mlook                     92 -1 -1 | 92 -1 -1 | 92 -1 -1
      input_novert                    0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_weapon1                   49 -1 -1 | 49 -1 -1 | 49 -1 -1
      input_weapon2                   50 -1 -1 | 50 -1 -1 | 50 -1 -1
      input_weapon3                   51 -1 -1 | 51 -1 -1 | 51 -1 -1
      input_weapon4                   52 -1 -1 | 52 -1 -1 | 52 -1 -1
      input_weapon5                   53 -1 -1 | 53 -1 -1 | 53 -1 -1
      input_weapon6                   54,113 -1 -1 | 54 -1 -1 | 54 -1 -1
      input_weapon7                   55,101 -1 -1 | 55 -1 -1 | 55 -1 -1
      input_weapon8                   56,122 -1 -1 | 56 -1 -1 | 56 -1 -1
      input_weapon9                   57,120 -1 -1 | 57 -1 -1 | 57 -1 -1
      input_nextweapon                0 -1 3 | 0 -1 3 | 0 -1 3
      input_prevweapon                0 -1 2 | 0 -1 2 | 0 -1 2
      input_toggleweapon              48 -1 -1 | 48 -1 -1 | 48 -1 -1
      input_fire                      157 0 22 | 157 0 22 | 157 0 22
      input_pause                     255 -1 -1 | 255 -1 -1 | 255 -1 -1
      input_map                       9 -1 21 | 9 -1 21 | 9 -1 21
      input_soundvolume               190 -1 -1 | 190 -1 -1 | 190 -1 -1
      input_hud                       191 -1 -1 | 191 -1 -1 | 191 -1 -1
      input_messages                  194 -1 -1 | 194 -1 -1 | 194 -1 -1
      input_gamma                     215 -1 -1 | 215 -1 -1 | 215 -1 -1
      input_spy                       216 -1 -1 | 216 -1 -1 | 216 -1 -1
      input_zoomin                    61 -1 -1 | 61 -1 -1 | 61 -1 -1
      input_zoomout                   45 -1 -1 | 45 -1 -1 | 45 -1 -1
      input_screenshot                42 -1 -1 | 42 -1 -1 | 42 -1 -1
      input_savegame                  188 -1 -1 | 188 -1 -1 | 188 -1 -1
      input_loadgame                  189 -1 -1 | 189 -1 -1 | 189 -1 -1
      input_quicksave                 192 -1 -1 | 192 -1 -1 | 192 -1 -1
      input_quickload                 195 -1 -1 | 195 -1 -1 | 195 -1 -1
      input_endgame                   193 -1 -1 | 193 -1 -1 | 193 -1 -1
      input_quit                      196 -1 -1 | 196 -1 -1 | 196 -1 -1
      input_map_follow                102 -1 -1 | 102 -1 -1 | 102 -1 -1
      input_map_zoomin                61 -1 -1 | 61 -1 -1 | 61 -1 -1
      input_map_zoomout               45 -1 -1 | 45 -1 -1 | 45 -1 -1
      input_map_up                    173 -1 -1 | 173 -1 -1 | 173 -1 -1
      input_map_down                  175 -1 -1 | 175 -1 -1 | 175 -1 -1
      input_map_left                  172 -1 -1 | 172 -1 -1 | 172 -1 -1
      input_map_right                 174 -1 -1 | 174 -1 -1 | 174 -1 -1
      input_map_mark                  109 -1 -1 | 109 -1 -1 | 109 -1 -1
      input_map_clear                 99 -1 -1 | 99 -1 -1 | 99 -1 -1
      input_map_gobig                 48 -1 -1 | 48 -1 -1 | 48 -1 -1
      input_map_grid                  103 -1 -1 | 103 -1 -1 | 103 -1 -1
      input_map_rotate                114 -1 -1 | 114 -1 -1 | 114 -1 -1
      input_map_overlay               111 -1 -1 | 111 -1 -1 | 111 -1 -1
      input_map_textured              0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_repeat_message            0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_speed_up                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_speed_down                0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_speed_default             0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_demo_skip                 210 -1 -1 | 210 -1 -1 | 210 -1 -1
      input_demo_endlevel             207 -1 -1 | 207 -1 -1 | 207 -1 -1
      input_walkcamera                304 -1 -1 | 304 -1 -1 | 304 -1 -1
      input_join_demo                 0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_restart                   199 -1 -1 | 199 -1 -1 | 199 -1 -1
      input_nextlevel                 209 -1 -1 | 209 -1 -1 | 209 -1 -1
      input_showalive                 0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_menu_down                 175 -1 12 | 175 -1 12 | 175 -1 12
      input_menu_up                   173 -1 11 | 173 -1 11 | 173 -1 11
      input_menu_left                 172 -1 13 | 172 -1 13 | 172 -1 13
      input_menu_right                174 -1 14 | 174 -1 14 | 174 -1 14
      input_menu_backspace            127 -1 1 | 127 -1 1 | 127 -1 1
      input_menu_enter                13 -1 0 | 13 -1 0 | 13 -1 0
      input_menu_escape               27 -1 6 | 27 -1 6 | 27 -1 6
      input_menu_clear                200 -1 4 | 200 -1 4 | 200 -1 4
      input_iddqd                     0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_idkfa                     0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_idfa                      0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_idclip                    0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_idbeholdh                 0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_idbeholdm                 0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_idbeholdv                 0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_idbeholds                 0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_idbeholdi                 0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_idbeholdr                 0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_idbeholda                 0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_idbeholdl                 0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_idmypos                   0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_idrate                    0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_iddt                      0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_ponce                     0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_shazam                    0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_chicken                   0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_lookup                    0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_lookdown                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_lookcenter                0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_use_artifact              182 -1 10 | 182 -1 10 | 182 -1 10
      input_arti_tome                 0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_arti_quartz               0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_arti_urn                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_arti_bomb                 0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_arti_ring                 0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_arti_chaosdevice          0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_arti_shadowsphere         0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_arti_wings                0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_arti_torch                0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_arti_morph                0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_invleft                   236 -1 13 | 236 -1 13 | 236 -1 13
      input_invright                  235 -1 14 | 235 -1 14 | 235 -1 14
      input_store_quick_key_frame     0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_restore_quick_key_frame   0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_rewind                    0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_cycle_profile             0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_cycle_palette             0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_command_display           0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_strict_mode               0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_console                   0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_coordinate_display        0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_fps                       0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_avj                       0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_exhud                     0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_mute_sfx                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_mute_music                0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_cheat_codes               0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_notarget                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_freeze                    0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_build                     0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_build_advance_frame       174 -1 -1 | 174 -1 -1 | 174 -1 -1
      input_build_reverse_frame       172 -1 -1 | 172 -1 -1 | 172 -1 -1
      input_build_reset_command       200 -1 -1 | 200 -1 -1 | 200 -1 -1
      input_build_source              182 -1 -1 | 182 -1 -1 | 182 -1 -1
      input_build_forward             119 -1 -1 | 119 -1 -1 | 119 -1 -1
      input_build_backward            115 -1 -1 | 115 -1 -1 | 115 -1 -1
      input_build_fine_forward        116 -1 -1 | 116 -1 -1 | 116 -1 -1
      input_build_fine_backward       103 -1 -1 | 103 -1 -1 | 103 -1 -1
      input_build_turn_left           113 -1 -1 | 113 -1 -1 | 113 -1 -1
      input_build_turn_right          101 -1 -1 | 101 -1 -1 | 101 -1 -1
      input_build_strafe_left         97 -1 -1 | 97 -1 -1 | 97 -1 -1
      input_build_strafe_right        100 -1 -1 | 100 -1 -1 | 100 -1 -1
      input_build_fine_strafe_left    102 -1 -1 | 102 -1 -1 | 102 -1 -1
      input_build_fine_strafe_right   104 -1 -1 | 104 -1 -1 | 104 -1 -1
      input_build_use                 32 -1 -1 | 32 -1 -1 | 32 -1 -1
      input_build_fire                157 -1 -1 | 157 -1 -1 | 157 -1 -1
      input_build_weapon1             49 -1 -1 | 49 -1 -1 | 49 -1 -1
      input_build_weapon2             50 -1 -1 | 50 -1 -1 | 50 -1 -1
      input_build_weapon3             51 -1 -1 | 51 -1 -1 | 51 -1 -1
      input_build_weapon4             52 -1 -1 | 52 -1 -1 | 52 -1 -1
      input_build_weapon5             53 -1 -1 | 53 -1 -1 | 53 -1 -1
      input_build_weapon6             54 -1 -1 | 54 -1 -1 | 54 -1 -1
      input_build_weapon7             55 -1 -1 | 55 -1 -1 | 55 -1 -1
      input_build_weapon8             56 -1 -1 | 56 -1 -1 | 56 -1 -1
      input_build_weapon9             57 -1 -1 | 57 -1 -1 | 57 -1 -1
      input_jump                      184 -1 1 | 184 -1 1 | 184 -1 1
      input_hexen_arti_incant         0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_hexen_arti_summon         0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_hexen_arti_disk           0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_hexen_arti_flechette      0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_hexen_arti_banishment     0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_hexen_arti_boots          0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_hexen_arti_krater         0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_hexen_arti_bracers        0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_script_0                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_script_1                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_script_2                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_script_3                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_script_4                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_script_5                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_script_6                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_script_7                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_script_8                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
      input_script_9                  0 -1 -1 | 0 -1 -1 | 0 -1 -1
    '';
  };
}
