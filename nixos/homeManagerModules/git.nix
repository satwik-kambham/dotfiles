{ pkgs, ... }:

{
  # Git
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "Satwik Kambham";
    userEmail = "satwik.kambham@gmail.com";
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      http.postBuffer = 524288000;
    };
  };

  # GitHub CLI
  programs.gh = {
    enable = true;
  };

  # Difftastic
  programs.git.difftastic = {
    enable = false;
  };
}
