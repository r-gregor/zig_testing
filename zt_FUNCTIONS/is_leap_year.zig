// is_leap_year.zig
// 20250326 v1 d

pub fn isLeapYear(year: u64) bool {
    if (@mod(year, 4) != 0)
        return false;
    if (@mod(year, 100) != 0)
        return true;
    return (0 == @mod(year, 400));
}
