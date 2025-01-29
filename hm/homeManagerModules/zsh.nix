{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      l = "eza -la --icons=auto";
      li = "l --git-ignore";
      lt = "li -T";
      shx = "sudo hx";
      gs = "git status";
      gd = "git diff";
      gdc = "git diff --cached";
      ga = "git add .";
      gp = "git push";
      gpu = "git pull";
      gc = "git commit -m";
    };

    history.size = 10000;
  };

  programs.zsh.shellAliases = {
    update = "home-manager switch";
  };
}
