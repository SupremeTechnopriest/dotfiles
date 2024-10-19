
# ▀█▀ █▀█ █▀▄ █▀█   █▀▀ █▀█ █▀▄▀█ █▀▄▀█ █▀▀ █▄░█ ▀█▀ █▀ 
# ░█░ █▄█ █▄▀ █▄█   █▄▄ █▄█ █░▀░█ █░▀░█ ██▄ █░▀█ ░█░ ▄█ 
# Todo Comment Renderer

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      todo-comments = {
        enable = true;

        settings.keywords = {
          FIX = {
            alt = [
              "FIXME"
              "FIXIT"
              "ISSUE"
              "BUG"
            ];
            color = "error";
            icon = " ";
          };
          HACK = {
            color = "warning";
            icon = " ";
          };
          NOTE = {
            alt = [
              "INFO"
            ];
            color = "hint";
            icon = " ";
          };
          PERF = {
            alt = [
              "OPTIM"
              "PERFORMANCE"
              "OPTIMIZE"
            ];
            icon = " ";
          };
          TEST = {
            alt = [
              "TESTING"
              "PASSED"
              "FAILED"
            ];
            color = "test";
            icon = " ";
          };
          TODO = {
            color = "info";
            icon = " ";
          };
          WARN = {
            alt = [
              "WARNING"
              "XXX"
            ];
            color = "warning";
            icon = " ";
          };
        };
      };

    };
  };
}
