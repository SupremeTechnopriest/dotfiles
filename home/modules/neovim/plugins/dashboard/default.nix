{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      dashboard = {
        enable = true;

	hideStatusline = true;
	hideTabline = true;

	center = [
	  {
	    icon = "";
	    desc = "Find File";
	    action = "Telescope find_files find_command=rf,--hidden,--files";
	    shortcut = "SPC f f";
	  }
	];

      };
    };
  };
}
