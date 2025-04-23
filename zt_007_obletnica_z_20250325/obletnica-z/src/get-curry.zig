// filename: get-curry.zig
// last change: 20250407 en

const time = @import("std").time;
const epoch = time.epoch;

pub fn getCurrentYear() u32 {
    const now = time.timestamp();
    const epoch_days: i64 = @divTrunc(now, (24 * 3600));
    var epoch_days_struct = epoch.EpochDay{ .day = @as(u47, @intCast(epoch_days)) };
    return epoch_days_struct.calculateYearDay().year; // returns u16
}
