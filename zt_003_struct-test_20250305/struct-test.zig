const std = @import("std");
const print = std.debug.print;

const Fmem = struct {
    name: []const u8,
    age: u32,
};

pub fn main() void {
    print("Hello Gregec! How are you?\n", .{});

    var GR = Fmem{
        .name = "Gregor Redelonghi",
        .age = 57,
    };

    const TMR = Fmem{
        .name = "Tadeja Mali Redelonghi",
        .age = 55,
    };

    print("Original name: {s};and age: {d}\n", .{ GR.name, GR.age });
    print("Original name: {s};and age: {d}\n", .{ TMR.name, TMR.age });

    GR.name = "Berthold Strolzenburger";
    GR.age = 104;
    print("New name: {s};and age: {d}\n", .{ GR.name, GR.age });

    // ERROR: cannot asign to 'constant'
    // TMR.name = "Mali Redelonghi Tadeja";
    // TMR.age = 50 + 5;
    // print("New name: {s};and age: {d}\n", .{ TMR.name, TMR.age });
}
