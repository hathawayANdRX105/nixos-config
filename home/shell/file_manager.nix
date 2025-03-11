{ config, pkgs, ... }: {
  programs.yazi = {
    enable = true;
    theme = {
      use = "tokyo-night";
      dark = "tokyo-night";
    };
    package = pkgs.unstable.yazi;

    settings = {
      manager.show_hidden = true;
      input.cursor_blink = true;
      plugin.previewrs = [ ];
      plugin.preloaders = [ ];
      opener = {
        edit = [{
          run = ''nu -e "code $@; exit;"'';
          block = true;
          for = "unix";
        }];
      };
    };

    keymap = {
      manager.prepend_keymap = [
        {
          on = [ "u" "a" ];
          run = "plugin yamb save";
        }
        {
          on = [ "u" "g" ];
          run = "plugin yamb jump_by_key";
        }
        {
          on = [ "u" "G" ];
          run = "plugin yamb jump_by_fzf";
        }
        {
          on = [ "u" "d" ];
          run = "plugin yamb delete_by_key";
        }
        {
          on = [ "u" "D" ];
          run = "plugin yamb delete_by_fzf";
        }
        {
          on = [ "u" "C" ];
          run = "plugin yamb delete_all";
        }
        {
          on = [ "u" "r" ];
          run = "plugin yamb rename_by_key";
        }
        {
          on = [ "u" "R" ];
          run = "plugin yamb rename_by_fzf";
        }

        {
          on = [ "T" ];
          run = "plugin toggle-pane min-preview";
          desc = "Show or hide the preview pane";
        }
      ];
    };

    initLua = ''
        require("full-border"):setup {
        	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
        	type = ui.Border.ROUNDED,
        }

        -- Defaultly hide preview after opening yazi 
        -- if os.getenv("NVIM") then
      	require("toggle-pane"):entry("min-preview")
        -- end

        -- You can configure your bookmarks by lua language
        local bookmarks = {}

        local path_sep = package.config:sub(1, 1)
        local home_path = ya.target_family() == "windows" and os.getenv("USERPROFILE") or os.getenv("HOME")
        if ya.target_family() == "windows" then
          table.insert(bookmarks, {
            tag = "Scoop Local",
            
            path = (os.getenv("SCOOP") or home_path .. "\\scoop") .. "\\",
            key = "p"
          })
          table.insert(bookmarks, {
            tag = "Scoop Global",
            path = (os.getenv("SCOOP_GLOBAL") or "C:\\ProgramData\\scoop") .. "\\",
            key = "P"
          })
        end
        table.insert(bookmarks, {
          tag = "Desktop",
          path = home_path .. path_sep .. "Desktop" .. path_sep,
          key = "d"
        })

        require("yamb"):setup {
          -- Optional, the path ending with path seperator represents folder.
          bookmarks = bookmarks,
          -- Optional, recieve notification everytime you jump.
          jump_notify = true,
          -- Optional, the cli of fzf.
          cli = "fzf",
          -- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
          keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
          -- Optional, the path of bookmarks
          path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark") or
                (os.getenv("HOME") .. "/.config/yazi/bookmark"),
        }

        require("no-status"):setup()
    '';
  };
}
