{ pkgs, ... }:

{
  # Git
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    lfs.enable = true;
    settings = {
      user.name = "Satwik Kambham";
      user.email = "satwik.kambham@gmail.com";
      init.defaultBranch = "main";
      http.postBuffer = 524288000;
    };
  };

  # GitHub CLI
  programs.gh = {
    enable = true;
  };

  # Difftastic
  programs.difftastic = {
    enable = false;
  };
}
