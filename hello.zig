const std = @import("std");

pub fn main() !void {
  const writer = std.io.getStdOut().writer();
  try writer.print("Hello {s}!\n", .{"Selim"});
}
