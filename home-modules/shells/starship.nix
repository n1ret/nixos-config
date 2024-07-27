{ pkgs, ... }:

{
  enable = true;

  settings = {
    format = pkgs.lib.concatStrings [
      "$username"
      "$hostname"
      "$git_branch"
      "$git_state"
      "$git_status"
      "$rust"
      "$python"
      "$line_break"
      "$jobs"
      "$nix_shell"
      "$directory"
      "$character"
    ];
    right_format = pkgs.lib.concatStrings [
      "$cmd_duration"
      "$time"
    ];

    username = {
      show_always = true;

      format = "[$user]($style)[@](bold)";
    };
    hostname = {
      ssh_only = false;

      style = "bold red";
      format = "[$ssh_symbol$hostname]($style) ";
    };
    git_status = {
      ahead = "⇡$count";
      diverged = "⇡$ahead_count⇣$behind_count";
      behind = "⇣$count";
      untracked = "[?$count](red)";
      modified = "[!$count](yellow)";
      staged = "[+$count](yellow)";
      renamed = "";
      deleted = "";
      style = "bold green";

      format = "([$all_status$ahead_behind]($style) )";
    };
    nix_shell = {
      format = "[$state]($style) ";
      impure_msg = "λ";
      pure_msg = "λλ";
    };
    directory = {
      truncate_to_repo = false;
      truncation_symbol = ".../";
    };

    cmd_duration = {
      min_time = 1;
      format = "[$duration]($style) ";
    };
    time = {
      disabled = false;

      format = "[$time]($style)";
    };
  };
}
