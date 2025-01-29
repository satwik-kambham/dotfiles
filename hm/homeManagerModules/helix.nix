{ pkgs, ... }:

{
  # Helix
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha_transparent";
      editor.soft-wrap.enable = true;
      editor.true-color = true;
      editor.color-modes = true;
    };
    ignores = [
      "!.gitignore"
    ];
    languages.language = [{
      name = "html";
      language-servers = [ "vscode-html-language-server" "tailwindcss-ls" ];
    }
      {
        name = "css";
        language-servers = [ "vscode-css-language-server" "tailwindcss-ls" ];
      }
      {
        name = "vue";
        language-servers = [ "vue-language-server" "tailwindcss-ls" ];
      }
      {
        name = "tsx";
        language-servers = [ "typescript-language-server" "tailwindcss-ls" ];
      }
      {
        name = "jsx";
        language-servers = [ "typescript-language-server" "tailwindcss-ls" ];
      }];
    languages.language-server.rust-analyzer.config = {
      check.command = "clippy";
    };
    themes.catppuccin_mocha_transparent = {
      inherits = "catppuccin_mocha";
      "ui.background" = { };
      "ui.statusline" = {
        fg = "#d1d1d1";
      };
    };
  };

}
