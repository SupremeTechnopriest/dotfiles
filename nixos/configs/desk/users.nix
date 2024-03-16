
# █░█ █▀ █▀▀ █▀█ █▀ 
# █▄█ ▄█ ██▄ █▀▄ ▄█ 


inputs : { config, lib, pkgs, ... }:

{
  users.users = {
    rl = {
      description = "Randy Lebeau";
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      shell = pkgs.zsh;
    }
  };
}
