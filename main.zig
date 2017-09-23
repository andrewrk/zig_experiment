const io = @import("std").io;
const macos = @cImport(@cInclude("macos.h"));
//const c = @cImport(@cInclude("stdio.h"));

pub fn main() -> %void {
  const x: i32 = macos.abc(36);
  %%io.stdout.printf("Hello, world: {}!\n", x);
}
