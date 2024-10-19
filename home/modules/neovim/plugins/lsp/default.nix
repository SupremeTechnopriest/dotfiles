
# █░░ █▀ █▀█ 
# █▄▄ ▄█ █▀▀ 
# Language Server Provider

{ pkgs, ... }:

{
  programs.nixvim = {

    plugins = {
      
      lsp = {
        enable = true;

        servers = {
          bashls.enable = true;
          cssls.enable = true;
          dockerls.enable = true;
          graphql.enable = true;
          helm_ls.enable = true;
          html.enable = true;
          htmx.enable = true;
          jsonls.enable = true;
          lua_ls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          sqls.enable = true;
          svelte.enable = true;
          tailwindcss.enable = true;
          # Typescript enabled by typescript-tools
          ts_ls.enable = false; 
          yamlls.enable = true;
          zls.enable = true;
        };
      };
    };
  };
}
