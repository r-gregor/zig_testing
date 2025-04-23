// v1: 20250317/en
// v2: 20250317/en
// v3: 20250319/en
const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const buffer = gpa.allocator();
    defer _ = gpa.deinit();

    // stores args into array which has len field
    const args = try std.process.argsAlloc(buffer);
    defer std.process.argsFree(buffer, args);

    const argc = args.len - 1;
    const arg = args[argc];

    print("There are {d} cli args\n", .{argc});

    if (argc == 0) {
        print("\n", .{});
        std.process.exit(1);
    }

    for (args, 0..) |arg1, i| {
        if (i == 0) continue; // v3: skipping firts argument: full path to prog_name
        print("arg {d}: {s:<20} -> {}\n", .{ i, arg1, @TypeOf(arg1) }); // v3: formatting
    }

    print("---\n", .{});

    for (1..args.len) |i| {
        print("arg {d}: {s:<20} -> {}\n", .{ i, args[i], @TypeOf(args[i]) }); // v3: formatting
    }

    print("---\n", .{});

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
        } else { // v3
            print("[ERROR] char '{c}' is not digit -- cannot convert to iteger\n", .{char});
            std.process.exit(1);
        }
        j += 1;
    }

    print("---\n", .{});

    print("Trying to convert string \"{s}\" into integer\n", .{arg});
    const bd_year = try std.fmt.parseInt(i32, arg, 10);
    print("Birth year: {d}\n", .{bd_year});

    // print("---\n", .{});
    // ERROR
    // print("Trying to convert string \"February\" into integer\n", .{});
    // const month_str: []const u8 = "February";
    // const bd_month = try std.fmt.parseInt(i32, month_str, 10);
    // print("Birth month: {d}\n", .{bd_month});

    print("\n", .{});
}
