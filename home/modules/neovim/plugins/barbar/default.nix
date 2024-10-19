
# █▄▄ ▄▀█ █▀█ █▄▄ ▄▀█ █▀█ 
# █▄█ █▀█ █▀▄ █▄█ █▀█ █▀▄ 
# Tab Bar

{ pkgs, ... }:

{
  programs.nixvim = {

    keymaps = [
      {
        key = "<leader>b";
        action = "<Nop>";
        options.desc = "Buffer";
      }
      {
        key = "<leader>q";
        action = "<Nop>";
        options.desc = "Close";
      }
      {
        key = "<leader>bm";
        action = "<Nop>";
        options.desc = "Move";
      }
      {
        key = "<leader>bo";
        action = "<Nop>";
        options.desc = "Order";
      }
    ];

    plugins = {

      web-devicons.enable = true;
      
      barbar = {
        enable = true;

        settings = {
          animation = true;
          clickable = true;
          highlight_visible = true;
          insert_at_end = true;
          semantic_letters = true;
          tabpages = true;
          no_name_title = "No Name";
          focus_on_close = "previous";
        };

        keymaps = {
          next = {
            key = "<leader><Tab>";
            options.desc = "Next Buffer";
          };
          previous = {
            key = "<leader><S-Tab>";
            options.desc = "Previous Buffer";
          };
          first = {
            key = "<leader>b0";
            options.desc = "First Buffer";
          };
          last = {
            key = "<leader>b$";
            options.desc = "Last Buffer";
          };
          goTo1 = {
            key = "<leader>b1";
            options.desc = "Go to Buffer 1";
          };
          goTo2 = {
            key = "<leader>b2";
            options.desc = "Go to Buffer 2";
          };
          goTo3 = {
            key = "<leader>b3";
            options.desc = "Go to Buffer 3";
          };
          goTo4 = {
            key = "<leader>b4";
            options.desc = "Go to Buffer 4";
          };
          goTo5 = {
            key = "<leader>b5";
            options.desc = "Go to Buffer 5";
          };
          goTo6 = {
            key = "<leader>b6";
            options.desc = "Go to Buffer 6";
          };
          goTo7 = {
            key = "<leader>b7";
            options.desc = "Go to Buffer 7";
          };
          goTo8 = {
            key = "<leader>b8";
            options.desc = "Go to Buffer 8";
          };
          goTo9 = {
            key = "<leader>b9";
            options.desc = "Go to Buffer 9";
          };
          moveNext = {
            key = "<leader>bml";
            options.desc = "Move Buffer Right";
          };
          movePrevious = {
            key = "<leader>bmh";
            options.desc = "Move Buffer Left";
          };
          pick = {
            key = "<leader>bf";
            options.desc = "Pick Buffer";
          };
          pin = {
            key = "<leader>bp";
            options.desc = "Pin Buffer";
          };
          restore = {
            key = "<leader>br";
            options.desc = "Restore Buffer";
          };
          close = {
            key = "<leader>qq";
            options.desc = "Close Buffer";
          };
          closeBuffersLeft = {
            key = "<leader>qh";
            options.desc = "Close Buffers Left";
          };
          closeBuffersRight = {
            key = "<leader>ql";
            options.desc = "Close Buffers Right";
          };
          closeAllButCurrentOrPinned = {
            key = "<leader>qa";
            options.desc = "Close All Buffers";
          };
          pickDelete = {
            key = "<leader>qf";
            options.desc = "Close All Buffers";
          };
          orderByDirectory = {
            key = "<leader>bod";
            options.desc = "Order by Directory";
          };
          orderByBufferNumber = {
            key = "<leader>bob";
            options.desc = "Order by Buffer";
          };
          orderByWindowNumber = {
            key = "<leader>bow";
            options.desc = "Order by Window";
          };
          orderByLanguage = {
            key = "<leader>bol";
            options.desc = "Order by Language";
          };
          orderByName = {
            key = "<leader>bon";
            options.desc = "Order by Name";
          };
        };
      };

    };
  };
}
