const std = @import("std");
const epoch = std.time.epoch;

pub fn getCurrentYear() u32 {
    const now = std.time.timestamp();
    const epoch_days: i64 = @divTrunc(now, (24 * 3600));
    var EpochDays = std.time.epoch.EpochDay{ .day = @as(u47, @intCast(epoch_days)) };
    return EpochDays.calculateYearDay().year; // returns u16
}
