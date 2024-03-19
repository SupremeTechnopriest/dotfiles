
# █▄░█ █▀▀ █▀█ █░█ █ █▀▄▀█ 
# █░▀█ ██▄ █▄█ ▀▄▀ █ █░▀░█ 


_: { config, lib, pkgs, ... }:

{
  # Add options for neovim, a terminal prompt
  options.neovim.enable = lib.mkEnableOption "neovim";

  # Install neovim if desired
  config = lib.mkIf config.neovim.enable {
    
     # Configure neovim
     programs.nixvim = {
       enable = true;
       viAlias = true;
       vimAlias = true;

       # extraLuaConfig = builtins.readFile ./config.lua;
     };
     
  };

  imports = [

    # Dashboard splash screen
    ./plugins/dashboard

    # File browsing
    ./plugins/neo-tree
  ];

}
