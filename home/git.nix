{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Miles";
      user.email = "mileslee1215@gmail.com";
    };
  };
}
