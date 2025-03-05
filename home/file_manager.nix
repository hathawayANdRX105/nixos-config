{ config, pkgs, ... }: {
  programs.yazi = {
    enable = true;
    theme = { dark = "flexoki-dark"; };
    package = pkgs.unstable.yazi;

    settings = {
      manager.show_hidden = true;
      input.cursor_blink = true;
      plugin.previewrs = [ ];
      plugin.preloaders = [ ];
    };

    keymap = {
      # manager.prepend_keymap = [
      #   {
      #     on = [ "u" "a" ];
      #     exec = "plugin yamb save";
      #   }
      #   {
      #     on = [ "u" "g" ];
      #     exec = "plugin yamb jump_by_key";
      #   }
      #   {
      #     on = [ "u" "G" ];
      #     exec = "plugin yamb jump_by_fzf";
      #   }
      #   {
      #     on = [ "u" "d" ];
      #     exec = "plugin yamb delete_by_key";
      #   }
      #   {
      #     on = [ "u" "D" ];
      #     exec = "plugin yamb delete_by_fzf";
      #   }
      #   {
      #     on = [ "u" "C" ];
      #     exec = "plugin yamb delete_all";
      #   }
      #   {
      #     on = [ "u" "r" ];
      #     exec = "plugin yamb rename_by_key";
      #   }
      #   {
      #     on = [ "u" "R" ];
      #     exec = "plugin yamb rename_by_fzf";
      #   }
      # ];
    };
  };
}
