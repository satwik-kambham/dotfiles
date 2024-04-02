{ pkgs, ... }:

{
  # Starship
  programs.starship = {
    enable = true;
    settings = {
      format = "$all";
      add_newline = false;
      aws.disabled = true;
      azure.disabled = true;
      gcloud.disabled = true;
    };
  };
}
