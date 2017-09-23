const Builder = @import("std").build.Builder;

pub fn build(b: &Builder) {
  b.addCIncludePath(".");
  const macos = b.addCObject("macos", "macos.c");
  macos.addCompileFlags([][]const u8 {
    "-std=c99"
  });

  const exe = b.addExecutable("main", "main.zig");
  exe.addObject(macos);
  b.default_step.dependOn(&exe.step);
}
