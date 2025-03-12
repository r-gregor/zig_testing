const print = @import("std").debug.print;

// f1 from www
fn divmod(numerator: u32, denominator: u32) struct { u32, u32 } {
    // returns a tuple that can be destructured
    return .{ numerator / denominator, numerator % denominator };
}

// f3
fn crtc() void {
    print("---\n", .{});
}

pub fn main() void {
    // f1
    var x: u32 = undefined;
    var y: u32 = undefined;
    var z: u32 = undefined;

    const tuple = .{ 1, 2, 3 };

    x, y, z = tuple;

    // print("tuple: x = {}, y = {}, z = {}\n", .{x, y, z});
    print("tuple: x = {}, y = {}, z = {}\n", tuple);

    // MINE ----------------------------------------------------------------------------
    // f2
    const div, const mod = divmod(10, 3);

    // is the sam as ...
    print("10 / 3 = {}\n", .{div});
    print("10 % 3 = {}\n", .{mod});

    // ... this:
    print("10 / 3 = {}\n10 % 3 = {}\n", divmod(10, 3));

    crtc(); // -------------------------------------------------

    // f3
    const names = [_][]const u8{ "Greg", "Tadeja", "Zala", "Mark", "Špela" };
    const names2: [5][]const u8 = .{ "Greg2", "Tadeja2", "Zala2", "Mark2", "Špela2" };
    print("First name: {s}\n", .{names[0]});
    print("First name2: {s}\n", .{names2[0]});

    print("names:  {s}\n", .{names});
    print("names2: {s}\n", .{names2});

    print("Typeof names:  '{}'\n", .{@TypeOf(names)});
    print("Typeof names2: '{}'\n", .{@TypeOf(names2)});

    crtc(); // -------------------------------------------------

    // for loop with external counter
    var i: u32 = 0;
    for (names) |name| {
        print("name  {d:02}: {s}\n", .{ i + 1, name });
        i += 1;
    }

    crtc(); // -------------------------------------------------

    // for loop with loop counter
    for (names2, 0..) |name2, j| {
        print("name2 {d:02}: {s}\n", .{ j + 1, name2 });
    }

    crtc(); // -------------------------------------------------

    // while loop
    var n: usize = names2.len;
    while (n > 0) {
        n -= 1;
        print("name2 {d:02}: {s}\n", .{ n + 1, names2[n] });
    }
}
