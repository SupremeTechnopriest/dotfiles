
{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      
      lualine = {
        enable = true;

	disabledFiletypes.statusline = [
	  "dashboard"
	  "neo-tree"
	  "undotree"
	];

	sections = {
	  lualine_a = ["mode"];
	  lualine_b = ["branch" "diff" "diagnostics"];
	  lualine_c = ["filename"];
	  lualine_x = ["filetype"];
	  lualine_y = ["progress"];
	  lualine_z = ["location"];
	};

      };

    };
  };
}
