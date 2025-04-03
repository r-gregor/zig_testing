// 20250325 v1 en
// 20250325 v2 en
// 20250326 v3 d
const std = @import("std");

const daysInNYear: u32 = 365;
const daysInLYear: u32 = 366;
const secondsInNYear: u32 = daysInNYear * 24 * 3600;
const secondsInLYear: u32 = daysInLYear * 24 * 3600;

// fn isLeapYear(year: u64) bool {
//     if (@mod(year, 4) != 0)
//         return false;
//     if (@mod(year, 100) != 0)
//         return true;
//     return (0 == @mod(year, 400));
// }

fn crtc() !void {
    const out = std.io.getStdOut().writer();
    try out.print("{s}\n", .{"-" ** 50});
}

pub fn main() !void {
    const startYear: u64 = 1989;
    var currYear: u64 = @import("get_curry.zig").getCurrentYear(); // v3

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
        if (@import("is_leap_year.zig").isLeapYear(@as(u64, startYear) + i)) {
            loveDays += daysInLYear;
            leapYears += 1;
        } else {
            loveDays += daysInNYear;
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
