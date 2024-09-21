
# █▀█ █▀   █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀ █▀ 
# █▄█ ▄█   █▄▄ █▄█ █░▀█ █▀░ █ █▄█ ▄█ 

{ self, ... } @ inputs: {
  dsk = self.lib.mkSystem { name = "dsk"; system = "x86_64-linux"; };
  srv = self.lib.mkSystem { name = "srv"; system = "x86_64-linux"; };
  mac = self.lib.mkSystem { name = "mac"; system = "aarch64-linux"; };
}
