{ config, pkgs, inputs, ... }:
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "273019910c1111a388dd20e057606016f4bd0d17";
    hash = "sha256-80mR86UWgD11XuzpVNn56fmGRkvj0af2cFaZkU8M31I=";
  };
in {
  programs.yazi = {
    enable = true;
    package = pkgs.unstable.yazi;
    theme = {
      flavor.dark = "flexoki-dark";
      use = "flexoki-dark";
    };
    shellWrapperName = "y";

    plugins = {
      git = "${yazi-plugins}/git.yazi";
      yamb = pkgs.fetchFromGitHub {
        owner = "h-hg";
        repo = "yamb.yazi";
        rev = "22af0033be18eead7b04c2768767d38ccfbaa05b";
        sha256 = "sha256-NMxZ8/7HQgs+BsZeH4nEglWsRH2ibAzq7hRSyrtFDTA=";
      };
      auto-layout = pkgs.fetchFromGitHub {
        owner = "josephschmitt";
        repo = "auto-layout.yazi";
        rev = "626a6016283558b9766fe305e76b694dd9fb6156";
        sha256 = "sha256-sGyy1tLDqR1aNrxQBHcswqussorIkQX70rsR2JoC1Lo=";
      };
      rich-preview = pkgs.fetchFromGitHub {
        owner = "AnirudhG07";
        repo = "rich-preview.yazi";
        rev = "2559e5fa7c1651dbe7c5615ef6f3b5291347d81a";
        hash = "sha256-dW2gAAv173MTcQdqMV32urzfrsEX6STR+oCJoRVGGpA=";
      };
      eza-preview = pkgs.fetchFromGitHub {
        owner = "ahkohd";
        repo = "eza-preview.yazi";
        rev = "6575a9a4806d8dc96ac75adf28791155551804fb";
        hash = "sha256-RwJu79bjdgmKbRaDH++y8wreBKdGGwbyGOx4G/px2PE=";
      };
    };

    flavors = {
      flexoki-dark = pkgs.fetchFromGitHub {
        owner = "gosxrgxx";
        repo = "flexoki-dark.yazi";
        rev = "3e8cfbaccf1f826d604cac83a83e89a5725500c5";
        hash = "sha256-W6Pzx48wr6PAiD7M+xn7n3jB4pOXXquqTaGY07VFPik=";
      };
    };

    settings = {
      manager.show_hidden = true;
      input.cursor_blink = true;
      opener = {
        edit = [{
          run = ''nu -e "open_file_in_helix $@; exit;"'';
          block = true;
          for = "unix";
        }];
      };

      plugin = {
        prepend_fetchers = [
          {
            id = "git";
            name = "*";
            run = "git";
          }
          {
            id = "git";
            name = "*/";
            run = "git";
          }
        ];

        prepend_previewers = [
          {
            name = "*.csv";
            run = "rich-preview";
          }
          {
            name = "*.md";
            run = "rich-preview";
          }
          {
            name = "*.rst";
            run = "rich-preview";
          }
          {
            name = "*.ipynb";
            run = "rich-preview";
          }
          {
            name = "*.json";
            run = "rich-preview";
          }
          {
            name = "*/";
            run = "eza-preview";
          }
        ];
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
      -- In your yazi config's init.lua
      require("auto-layout")

      th.git = th.git or {}
      th.git.modified = ui.Style():fg("blue")
      th.git.deleted = ui.Style():fg("red"):bold()
      th.git.modified_sign = "M"
      th.git.deleted_sign = "D"
      require("git"):setup()


      require("eza-preview"):setup({})

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

      -- require("no-status"):setup()
    '';
  };
}
