// v1: 20250317/en
const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const buffer = gpa.allocator();

    // stores cli args into ArgIterator (struct with no len field)
    var args = try std.process.argsWithAllocator(buffer);
    defer args.deinit();

    _ = args.skip(); // skip first arg -> progname

    while (args.next()) |arg| {
        print("{s} ==> {}\n", .{ arg, @TypeOf(arg) });
    }
    print("\n", .{});
}
