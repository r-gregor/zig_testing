const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const v1 = b.addExecutable(.{
        .name = "cli-args-test-iterator-w",
        .root_source_file = b.path("src/cli-args-test-iterator-w.zig"),
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(v1);

    const v2 = b.addExecutable(.{
        .name = "cli-args-test-array",
        .root_source_file = b.path("src/cli-args-test-array.zig"),
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(v2);
}
