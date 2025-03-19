// v1: 20250317/en
// v2: 20250319/en
const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const buffer = gpa.allocator();

    // stores cli args into ArgIterator (struct with no len field)
    var args = try std.process.argsWithAllocator(buffer);
    var args1 = args;
    var args2 = args;

    // test
    print("TypeOf(args1): {}\n", .{@TypeOf(args1)});
    print("TypeOf(args2): {}\n", .{@TypeOf(args2)});

    defer args.deinit();

    _ = args1.skip(); // skip first arg -> prog_name/binary

    var argc: u32 = 0;
    while (args1.next()) |arg| {
        _ = arg;
        argc += 1;
    }

    print("---\n", .{});

    print("There are {d} args\n", .{argc});
    if (argc == 0) {
        print("\n", .{});
        std.process.exit(1);
    }

    _ = args2.skip(); // skip first arg -> prog_name/binary
    while (args2.next()) |arg| {
        print("{s:<20} ==> {}\n", .{ arg, @TypeOf(arg) });
    }
    print("\n", .{});
}
