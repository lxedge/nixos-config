{ config, pkgs, ... }:

{
  programs.git.enable = true;

  programs.git.config = {
    init.defaultBranch = "master";
    user.name = "Miles";
    user.email = "mileslee1215@gmail.com";
    core.editor = "vim";
    pull.ff = "only";
  };
}
