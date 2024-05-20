{ pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.gnome.seahorse.out}/libexec/seahorse/ssh-askpass";

  environment.systemPackages = with pkgs; [
    (catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "mauve" ];
    })
    whitesur-kde
  ];
}
