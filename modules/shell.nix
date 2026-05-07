{ config, pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableLsColors = true;

    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "pattern"
      ];
      patterns = {
        "rm -rf *" = "fg=white,bold,bg=red";
      };
    };

    autosuggestions = {
      enable = true;
      highlightStyle = "fg=#ff00ff,bold,underline";
    };

    ohMyZsh = {
      enable = true;
      plugins = [
        "sudo"
        "direnv"
        "z"
        "extract"
        "git"
        "history"
        "docker"
        "docker-compose"
        "colored-man-pages"
      ];
    };

    shellInit = ''
      if [ -f "$HOME/.secrets" ]; then
        source "$HOME/.secrets"
      fi
    '';

    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };

  environment.systemPackages = [ pkgs.zsh-powerlevel10k ];
}
