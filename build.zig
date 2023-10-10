const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});


    const lib = b.addStaticLibrary(.{
        .name = "fmt",
        .target = target,
        .optimize = optimize,
    });
    const flags = &[_][]const u8 { "-std=c++17", "-Wall", "-Werror", "-fPIC" };
    lib.addCSourceFile(.{ .file = .{ .path = "src/format.cc" }, .flags = flags });
    lib.addCSourceFile(.{ .file = .{ .path = "src/os.cc" }, .flags = flags });
    lib.addIncludePath(.{ .path = "include/" });
    lib.linkSystemLibrary("stdc++");
    b.installArtifact(lib);
}
