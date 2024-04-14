{ pkgs, ... }:

{
  # Helix
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor.soft-wrap.enable = true;
    };
  };

}
