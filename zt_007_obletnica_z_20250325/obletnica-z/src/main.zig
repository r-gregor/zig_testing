// 20250325 v1 en
// 20250325 v2 en
// 20250326 v3 d
// 20250403 v4 en
// 20250415 v5 en

const std = @import("std");

// local imports
const currYr = @import("get-curry.zig");
const leapYr = @import("is-leap-year.zig");

const daysInYear: u32 = 365;

fn crtc() !void {
    const out = std.io.getStdOut().writer();
    try out.print("{s}\n", .{"-" ** 50});
}

pub fn main() !void {
    const startYear: u64 = 1989;
    var currYear: u64 = currYr.getCurrentYear();

    // v2: get user input
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const buffer = gpa.allocator();
    defer _ = gpa.deinit();

    const args = try std.process.argsAlloc(buffer);
    defer std.process.argsFree(buffer, args);

    const argc = args.len - 1;

    if (argc == 1) {
        currYear = try std.fmt.parseInt(u64, args[1], 10);
    }

    const out = std.io.getStdOut().writer();
    const yearsBetween = currYear - startYear;

    var loveDays: u64 = 0;
    var leapYears: u64 = 0;
    for (0..yearsBetween) |i| {
        if (leapYr.isLeapYear(@as(u64, startYear) + i)) {
            loveDays += daysInYear + 1;
            leapYears += 1;
        } else {
            loveDays += daysInYear;
        }
    }

    try crtc();
    try out.print("{d:>20} start year\n", .{startYear});
    try out.print("{d:>20} current year\n", .{currYear});
    try crtc();
    try out.print("{d:>20} years ({d} leap years)\n", .{ yearsBetween, leapYears });
    try out.print("{d:>20} days\n", .{loveDays});
    try out.print("{d:>20} hours\n", .{loveDays * 24});
    try out.print("{d:>20} minutes\n", .{loveDays * 24 * 60});
    try out.print("{d:>20} seconds\n", .{loveDays * 24 * 3600});
    try crtc();
}
