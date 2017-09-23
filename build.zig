const Builder = @import("std").build.Builder;

pub fn build(b: &Builder) {
  b.addCIncludePath(".");
  const macos = b.addCSharedLibrary("macos", b.version(0, 0, 0));
  macos.addSourceFile("macos.c");
  macos.addCompileFlags([][]const u8 {
    "-ObjC"
  });

  const exe = b.addExecutable("main", "main.zig");
  exe.linkLibrary(macos);
  b.default_step.dependOn(&exe.step);
}
