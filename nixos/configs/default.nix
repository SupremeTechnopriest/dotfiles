
# █▀█ █▀   █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀ █▀ 
# █▄█ ▄█   █▄▄ █▄█ █░▀█ █▀░ █ █▄█ ▄█ 

{ self, ... } @ inputs: {
  dsk = self.lib.mkSystem { name = "dsk"; system = "x86_64-linux"; };
  srv = self.lib.mkSystem { name = "srv"; system = "x86_64-linux"; };
  vm = self.lib.mkSystem { name = "vm"; system = "aarch64-linux"; };
}
