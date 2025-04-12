{ pkgs, ... }:

{
  xdg.desktopEntries = {
    rift = {
      name = "Rift";
      genericName = "Text Editor";
      exec = "rift_egui";
      categories = [ "Development" "TextEditor" ];
      comment = "Text Editor";
      terminal = false;
    };
  };
}
