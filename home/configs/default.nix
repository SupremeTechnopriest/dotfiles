
# █░█ █▀█ █▀▄▀█ █▀▀   █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀ █▀ 
# █▀█ █▄█ █░▀░█ ██▄   █▄▄ █▄█ █░▀█ █▀░ █ █▄█ ▄█ 

{ self, ... } @ inputs: {
  "rl@dsk" = self.lib.mkHome { user = "rl"; host = "dsk"; system = "x86_64-linux"; };
  "rl@srv" = self.lib.mkHome { user = "rl"; host = "srv"; system = "x86_64-linux"; };
  "rl@vm" = self.lib.mkHome { user = "rl"; host = "vm"; system = "aarch64-linux"; };
  "rl@mac" = self.lib.mkHome { user = "rl"; host = "mac"; system = "aarch64-darwin"; };
}
