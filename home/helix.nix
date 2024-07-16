{ config, pkgs, lib, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    languages = {
      language = [
        { name = "rust"; }
        { name = "python"; }
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
        }
      ];

      language-server.rust-analyzer.config.check = { command = "clippy"; };
    };

    settings = {
      theme = "tokyonight_moon";
      editor = {
        cursorline = true;
        auto-save = true;
        completion-timeout = 100;
        completion-replace = true;
        true-color = true;
        bufferline = "always";
        color-modes = true;
        completion-trigger-len = 1;

        cursor-shape.insert = "bar";
        cursor-shape.normal = "block";
        cursor-shape.select = "underline";

        file-picker.hidden = false;

        statusline = {
          left = [ "spinner" "spacer" "mode" "spacer" "diagnostics" ];

          center = [ "file-modification-indicator" "file-base-name" ];

          right = [
            "version-control"
            "position"
            "file-encoding"
            "spacer"
            "file-type"
          ];
        };

        lsp.display-inlay-hints = true;
        lsp.display-messages = true;

        soft-wrap.enable = true;
      };

      keys.normal = {
        "C-g" = "goto_line";
        "C-s" = ":w";

        "C-\\" = ":config-reload";
        "A-\\" = ":config-open";

        "A-h" = ":buffer-previous";
        "A-l" = ":buffer-next";

        space.q = ":buffer-close!";
      };

      keys.insert = {
        j = { k = "normal_mode"; };

        "A-f" = "move_next_word_end";
        "A-b" = "move_prev_word_end";
        "C-left" = "move_prev_word_end";
        "C-right" = "move_next_word_end";
        "C-f" = "move_char_right";
        "C-b" = "move_char_left";

        "C-]" = "indent";
        "C-[" = "unindent";

        "C-a" = "goto_line_start";
        "C-e" = "goto_line_end_newline";

        "C-n" = "move_line_down";
        "C-p" = "move_line_up";

        "C-z" = "undo";
        "C-u" = "redo";

        "A-d" = "delete_word_backward";
        "C-s" = ":w";

        "C-ret" = "open_above";
        "S-ret" = "open_below";

        "A-h" = ":buffer-previous";
        "A-l" = ":buffer-next";
      };

    };
  };
}
