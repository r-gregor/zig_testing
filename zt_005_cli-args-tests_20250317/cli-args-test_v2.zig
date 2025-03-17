// v1: 20250317/en
// v2: 20250317/en
const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const buffer = gpa.allocator();
    defer _ = gpa.deinit();

    // stores args into array which has len field
    const args = try std.process.argsAlloc(buffer);
    defer std.process.argsFree(buffer, args);

    print("There are {d} cli args\n", .{args.len - 1});

    for (args, 1..) |arg, i| {
        print("arg_{d}: {s} -> {}\n", .{ i, arg, @TypeOf(arg) });
    }

    print("---\n", .{});

    for (1..args.len) |i| {
        print("arg_{d}: {s} -> {}\n", .{ i, args[i], @TypeOf(args[i]) });
    }

    print("---\n", .{});

    const argc = args.len - 1;
    const arg = args[argc];

    var j: usize = 0;
    while (j < arg.len) {
        const char = arg[j];
        print("{c}", .{char});
        j += 1;
    }
    print("\n", .{});

    print("---\n", .{});

    j = 0;
    while (j < arg.len) {
        const char = arg[j];
        if (std.ascii.isDigit(char)) {
            print("char '{c}' is digit\n", .{char});
        }
        j += 1;
    }
    print("\n", .{});

    print("---\n", .{});

    print("Trying to convert string \"1968\" into integer\n", .{});
    const bd_year = try std.fmt.parseInt(i32, arg, 10);
    print("Birth year: {d}\n", .{bd_year});

    // print("---\n", .{});
    // ERROR
    // print("Trying to convert string \"February\" into integer\n", .{});
    // const month_str: []const u8 = "February";
    // const bd_month = try std.fmt.parseInt(i32, month_str, 10);
    // print("Birth month: {d}\n", .{bd_month});
}
