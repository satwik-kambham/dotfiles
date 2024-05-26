{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha";
  };
  services.desktopManager.plasma6.enable = true;
  programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.gnome.seahorse.out}/libexec/seahorse/ssh-askpass";

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
    })
    (catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "mauve" ];
    })
    whitesur-kde
  ];
}
