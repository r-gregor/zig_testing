const print = @import("std").debug.print;

pub fn main() void {
    var sum: u64 = 0;

    for (0..1000_000_000) |i| {
        sum += i;
    }
    print("Sum: {d}\n", .{sum});
}
