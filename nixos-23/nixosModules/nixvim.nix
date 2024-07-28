{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    globalOpts = {
      # Line numbers
      number = true;
      relativenumber = false;

      # Always show the signcolumn, otherwise text would be shifted when displaying error icons
      signcolumn = "yes";

      # Search
      ignorecase = true;
      smartcase = true;

      # Tab defaults (might get overwritten by an LSP server)
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 0;
      expandtab = true;
      smarttab = true;

      # System clipboard support, needs xclip/wl-clipboard
      clipboard = "unnamedplus";

      # Highlight the current line
      cursorline = true;

      # Show line and column when searching
      ruler = true;

      # Global substitution by default
      gdefault = true;

      # Start scrolling when the cursor is X lines away from the top/bottom
      scrolloff = 5;
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
      separatorStyle = "padded_slope";
    };

    # Nvim tree
    plugins.nvim-tree.enable = true;

    # Status Line
    plugins.lualine = {
      enable = true;
      theme = "horizon";
    };

    # Treesitter
    plugins.treesitter = {
      enable = true;
    };
  };
}
