const std = @import("std");
const parseInt = std.fmt.parseInt;

test "parse integers" {
    const input = "123 67 89,99";
    const ally = std.testing.allocator;

    var list = std.ArrayList(u32).init(ally);
    // Ensure the list is freed at scope exit.
    // Try commenting out this line!
    defer list.deinit();

    var it = std.mem.tokenize(u8, input, " ,");
    while (it.next()) |num| {
        const n = try parseInt(u32, num, 10);
        try list.append(n);
    }

    const expected = [_]u32{ 123, 67, 89, 99 };

    // this is a multi-object for loop
    // only works in zig 0.11.0 and above
    // for (expected, list.items) |exp, actual| {
    //    try std.testing.expectEqual(exp, actual);
    // }

    for (expected) |exp, i| {
        try std.testing.expectEqual(exp, list.items[i]);
    }
}

