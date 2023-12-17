const std = @import("std");

const arr1 = [_]u8{ 'a', 'b', 'c' };
const arr2 = [_]u8{ 'A', 'B', 'C' };
const arr3 = [_]u8{ '1', '2', '3' };

pub fn main() std.fs.File.WriteError!void {
    const stdout = std.io.getStdOut();
    const stdout_w = stdout.writer();
    for (arr1, arr2, arr3) |arr1_e, arr2_e, arr3_e| {
        try stdout_w.print("{c} {c} {c}\n", .{ arr1_e, arr2_e, arr3_e });
    }
}
