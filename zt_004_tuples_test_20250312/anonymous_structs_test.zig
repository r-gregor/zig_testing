const print = @import("std").debug.print;

pub fn main() !void {
    // tuple (unnamed fields)
    const tea = .{ "keemun", 10 };

    // anonymous structor (named fields)
    const fthr = .{ .name = "Gregor", .age = 57 };

    // printing 'tuples'
    // This is the same as ...
    print("Type: {s}, Quality: {d}\n", .{ tea.@"0", tea.@"1" });
    // ... this:
    print("Type: {s}, Quality: {d}\n", .{ tea[0], tea[1] });

    // printing 'anonymous structs'
    print("Fathers name: {s}, and age: {d}\n", .{ fthr.name, fthr.age });
}
