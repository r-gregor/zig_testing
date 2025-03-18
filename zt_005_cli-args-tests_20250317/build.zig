const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const v1 = b.addExecutable(.{
        .name = "cli-args-test_v1",
        .root_source_file = b.path("src/cli-args-test_v1.zig"),
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(v1);

    const v2 = b.addExecutable(.{
        .name = "cli-args-test_v2",
        .root_source_file = b.path("src/cli-args-test_v2.zig"),
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(v2);
}
