// 20250325 v1 en
// 20250325 v2 en
const std = @import("std");
const print = std.debug.print;
const epoch = std.time.epoch;

pub fn getCurrentYear() u32 {
    const now = std.time.timestamp();
    const epoch_days: i64 = @divTrunc(now, (24 * 3600));
    var EpochDays = std.time.epoch.EpochDay{ .day = @as(u47, @intCast(epoch_days)) };
    return EpochDays.calculateYearDay().year; // returns u16
}

pub fn main() !void {
    const curr_year: u32 = getCurrentYear();
    print("Current year: {d}\n", .{curr_year});
}
