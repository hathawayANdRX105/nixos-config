{ config, pkgs, ... }: {
  programs.starship = {
    enable = true;
    settings = {
      scan_timeout = 10;
      add_newline = false;
      line_break.disabled = true;
      format = " $directory$username$character";
      right_format =
        "$cmd_duration$git_branch$git_metrics$git_commit$git_state$all";

      cmd_duration.format = "[$duration](italic dimmed blue) ";
      character = {
        success_symbol = "[λ](green)";
        error_symbol = "[λ](red)";
        vimcmd_symbol = "[λ](green)";
      };
      directory = {
        home_symbol = "~";
        style = "cyan";
      };
      git_commit.tag_symbol = " tag ";
      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style) ";
        style = "purple";
        symbol = "";
      };
      git_metrics = {
        added_style = "bold yellow";
        deleted_style = "bold red";
        disabled = false;
      };
      git_status.disabled = true;
      time = {
        disabled = false;
        format = "[$time]($style)";
        time_format = "%R";
        style = "italic dimmed white";
      };
      aws.symbol = "aws ";
      bun.symbol = "bun ";
      c.symbol = "C ";
      cobol.symbol = "cobol ";
      conda.symbol = "conda ";
      crystal.symbol = "cr ";
      cmake.symbol = "cmake ";
      daml.symbol = "daml ";
      dart.symbol = "dart ";
      deno.symbol = "deno ";
      dotnet.symbol = ".NET ";
      directory.read_only = " ro";
      docker_context.symbol = "docker ";
      elixir.symbol = "exs ";
      elm.symbol = "elm ";
      golang.symbol = "go ";
      guix_shell.symbol = "guix ";
      hg_branch.symbol = "hg ";
      java.symbol = "java ";
      julia.symbol = "jl ";
      kotlin.symbol = "kt ";
      lua.symbol = "lua ";
      memory_usage.symbol = "memory ";
      meson.symbol = "meson ";
      nim.symbol = "nim ";
      nix_shell.symbol = "nix ";
      ocaml.symbol = "ml ";
      opa.symbol = "opa ";
      nodejs.symbol = "nodejs ";
      package.symbol = "pkg ";
      perl.symbol = "pl ";
      php.symbol = "php ";
      pulumi.symbol = "pulumi ";
      purescript.symbol = "purs ";
      python.symbol = "py ";
      raku.symbol = "raku ";
      ruby.symbol = "rb ";
      rust.symbol = "rs ";
      scala.symbol = "scala ";
      spack.symbol = "spack ";
      swift.symbol = "swift ";
      terraform.symbol = "terraform ";
      zig.symbol = "zig ";
    };
  };
}
