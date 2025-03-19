// const std =   @import("std").debug.print;
const std = @import("std");

// f1 from www
fn divmod(numerator: u32, denominator: u32) struct { u32, u32 } {
    // returns a tuple (, or anonymous struct) that can be destructured
    return .{ numerator / denominator, numerator % denominator };
}

// f3
fn crtc() !void {
    // std.debug.print("---\n", .{});
    const stdout = std.io.getStdOut().writer();
    try stdout.print("---\n", .{});
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    // f1
    var x: u32 = undefined;
    var y: u32 = undefined;
    var z: u32 = undefined;

    const tuple = .{ 1, 2, 3 };

    x, y, z = tuple;

    // print("tuple: x = {}, y = {}, z = {}\n", .{x, y, z});
    try stdout.print("tuple: x = {}, y = {}, z = {}\n", tuple);

    const div, const mod = divmod(10, 3);

    // MINE ----------------------------------------------------------------------------
    // f2

    // is the sam as ...
    try stdout.print("10 / 3 = {}\n", .{div});
    try stdout.print("10 % 3 = {}\n", .{mod});

    // ... this:
    try stdout.print("10 / 3 = {}\n10 % 3 = {}\n", divmod(10, 3));

    try crtc(); // -------------------------------------------------

    // f3
    const names = [_][]const u8{ "Greg", "Tadeja", "Zala", "Mark", "Špela" };
    const names2: [5][]const u8 = .{ "Greg2", "Tadeja2", "Zala2", "Mark2", "Špela2" };
    try stdout.print("First name:  {s}\n", .{names[0]});
    try stdout.print("First name2: {s}\n", .{names2[0]});

    try stdout.print("names:  {s}\n", .{names});
    try stdout.print("names2: {s}\n", .{names2});

    try stdout.print("Typeof names:  '{}'\n", .{@TypeOf(names)});
    try stdout.print("Typeof names2: '{}'\n", .{@TypeOf(names2)});

    try crtc(); // -------------------------------------------------

    // for loop with external counter
    var i: u32 = 0;
    for (names) |name| {
        try stdout.print("name  {d:02}: {s}\n", .{ i + 1, name });
        i += 1;
    }

    try crtc(); // -------------------------------------------------

    // for loop with loop counter
    for (names2, 0..) |name2, j| {
        try stdout.print("name2 {d:02}: {s}\n", .{ j + 1, name2 });
    }

    try crtc(); // -------------------------------------------------

    // while loop
    var n: usize = names2.len;
    while (n > 0) {
        n -= 1;
        try stdout.print("name2 {d:02}: {s}\n", .{ n + 1, names2[n] });
    }
}
