const std = @import("std");

const Person = struct {
    age: u8,
};

pub fn main() void {
    // const maybe_p: Person = null; // compile error: expected type 'Person', found '@Type(.Null)'
    const maybe_p: ?Person = null; // OK

    // std.debug.print("{}", { maybe_p.age }); // compile error: type '?Person' does not support field access
    std.debug.print("{}", .{(maybe_p orelse Person{ .age = 25 }).age}); // OK

    if (maybe_p) |p| {
        std.debug.print("{}", .{p.age}); // OK
    }
}
