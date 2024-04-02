{ pkgs, ... }:

{
  # Git
  programs.git = {
    enable = true;
    userName = "Satwik Kambham";
    userEmail = "satwik.kambham@gmail.com";
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Difftastic
  programs.git.difftastic = {
    enable = true;
  };
}
