{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    enableCompletion = true;
    enableLsColors = true;

    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
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
  };
}
