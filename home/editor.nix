{ config, pkgs, lib, inputs, ... }: {
  programs.helix = {
    enable = true;
    package = pkgs.unstable.helix;
    defaultEditor = true;

    languages = {
      language = [
        { name = "rust"; }
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
        completion-timeout = 150;
        bufferline = "always";
        completion-trigger-len = 1;
        end-of-line-diagnostics = "error";

        auto-save.after-delay.enable = true;
        auto-save.after-delay.timeout = 10000;

        inline-diagnostics.cursor-line = "warning";
        inline-diagnostics.other-lines = "warning";

        # completion-replace = true;
        # true-color = true;
        # color-modes = true;

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

        # lsp.display-inlay-hints = true;
        lsp.display-messages = true;

        soft-wrap.enable = true;
      };

      keys.normal = {
        "C-g" = "goto_line";
        "C-s" = ":w";
        # "A-g" = [":new" ":insert-output lazygit" ":buffer-close!" ":redraw"];
        # "A-f" = [":new" ":insert-output yazi" ":buffer-close!" ":redraw"];

        "C-/" = "toggle_comments";
        "C-;" = "code_action";
        "C-'" = "goto_word";

        "A-`" = "no_op";
        "C-`" = "switch_to_uppercase";

        "C-up" = "scroll_up";
        "C-down" = "scroll_down";

        "C-]" = "indent";
        "C-[" = "unindent";

        "C-\\" = ":config-reload";
        "A-\\" = ":config-open";

        "A-h" = ":buffer-previous";
        "A-l" = ":buffer-next";

        "C-c" = "yank_to_clipboard";
        "C-v" = "paste_clipboard_after";

        # use system clipboard
        y = "yank_to_clipboard";
        p = "paste_clipboard_after";
        P = "paste_clipboard_before";
        R = "replace_selections_with_clipboard";
        d = [ "yank_to_clipboard" "delete_selection" ];

        # change select word approach
        ## w/b/e   select a basic word
        ## W/B/E   select a long  word
        ## S-w/b/e select a sub   word
        # > = "move_next_sub_word_start";
        # < = "move_prev_sub_word_start";
        # S-e = "move_next_sub_word_end";

        tab = "move_parent_node_end";
        "S-tab" = "move_parent_node_start";

        space.q = ":buffer-close!";
        space.e = ":quit!";
      };

      keys.select = {
        "C-c" = "yank_to_clipboard";
        "C-v" = "paste_clipboard_before";

        y = "yank_to_clipboard";
        P = "paste_clipboard_before";
        R = "replace_selections_with_clipboard";
        d = [ "yank_to_clipboard" "delete_selection" ];

        tab = "extend_parent_node_end";
        S-tab = "extend_parent_node_start";

      };

      keys.insert = {
        j = { k = "normal_mode"; };

        # move around in insert mode
        "A-f" = [ "move_next_word_end" "extend_char_right" ];
        "A-b" = "move_prev_word_end";
        "C-right" = [ "move_next_sub_word_end" "extend_char_right" ];
        "C-left" = "move_prev_sub_word_end";
        "C-f" = "move_char_right";
        "C-b" = "move_char_left";

        "S-tab" = "move_parent_node_start";

        # select content in insert mode
        "S-left" = "extend_char_left";
        "S-right" = "extend_char_right";
        "S-up" = "extend_line_up";
        "S-down" = "extend_line_down";

        # scroll
        "C-up" = "scroll_up";
        "C-down" = "scroll_down";

        # indent
        "C-]" = "indent";
        "C-[" = "unindent";

        # delete word 
        "C-backspace" = "delete_word_backward";
        "A-backspace" = "delete_word_forward";
        "S-backspace" = "delete_selection";
        # Ctrl-h -> delete-char-forward
        # Ctrl-d -> delete-char-backward
        "C-d" = "no_op";
        "C-l" = "delete_char_forward";

        "C-a" = "goto_line_start";
        "C-e" = "goto_line_end_newline";

        "C-n" = "move_line_down";
        "C-p" = "move_line_up";

        "C-z" = "undo";
        "C-u" = "redo";
        "C-c" = "yank_to_clipboard";
        "C-v" = "paste_clipboard_before";

        "C-\\" = ":config-reload";
        "A-\\" = ":config-open";

        "C-s" = ":w";
        "C-/" = "toggle_comments";
        "C-;" = "code_action";
        "C-'" = "goto_word";

        "C-ret" = "open_above";
        "S-ret" = "open_below";

        "A-h" = ":buffer-previous";
        "A-l" = ":buffer-next";
      };

    };
  };
}
