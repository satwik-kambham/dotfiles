{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    opts = {
      shiftwidth = 2;
    };
    keymaps = [
      {
        key = "<C-b>";
        action = "<cmd>NvimTreeToggle<CR>";
      }
      {
        key = "<M-b>";
        action = "<cmd>NvimTreeFocus<CR>";
      }
    ];

    # Colorscheme
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        transparent_background = true;
      };
    };

    # Buffer Line
    plugins.barbecue.enable = true;
    plugins.bufferline = {
      enable = true;
      separatorStyle = "slope";
    };

    # Nvim tree
    plugins.nvim-tree.enable = true;

    # Status Line
    plugins.lualine = {
      enable = true;
      theme = "horizon";
    };
  };
}
