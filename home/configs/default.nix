
# █░█ █▀█ █▀▄▀█ █▀▀   █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀ █▀ 
# █▀█ █▄█ █░▀░█ ██▄   █▄▄ █▄█ █░▀█ █▀░ █ █▄█ ▄█ 

{ self, ... } @ inputs: {
  "rl@dsk" = self.lib.mkHome "rl" "dsk" "x86_64-linux";
  "rl@srv" = self.lib.mkHome "rl" "srv" "x86_64-linux";
}
