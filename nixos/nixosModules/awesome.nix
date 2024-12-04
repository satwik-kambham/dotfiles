{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.windowManager.awesome = {
    enable = true;
    luaModules = with pkgs.luaPackages; [];
  };

  environment.systemPackages = with pkgs; [
  ];
}
