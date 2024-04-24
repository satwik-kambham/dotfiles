{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;

    # Colorscheme
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        transparent_background = true;
      };
    };

    # Buffer Line
    plugins.barbecue.enable = true;

    # Nvim tree
    plugins.nvim-tree.enable = true;

    # Status Line
    plugins.lualine = {
      enable = true;
      theme = "horizon";
    };
  };
}
