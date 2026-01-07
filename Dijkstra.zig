const std = @import("std");

const INF = 1_000_000;

pub fn dijkstra(graph: [][]i32, start: usize) []i32 {
    const n = graph.len;
    var dist = std.heap.page_allocator.alloc(i32, n) catch unreachable;
    var visited = std.heap.page_allocator.alloc(bool, n) catch unreachable;

    for (0..n) |i| {
        dist[i] = INF;
        visited[i] = false;
    }
    dist[start] = 0;

    for (0..n - 1) |_| {
        var min = INF;
        var u: isize = -1;

        for (0..n) |i| {
            if (!visited[i] and dist[i] < min) {
                min = dist[i];
                u = @intCast(i);
            }
        }

        if (u == -1) break;
        visited[@intCast(u)] = true;

        for (0..n) |v| {
            if (!visited[v] and graph[@intCast(u)][v] != 0 and
                dist[@intCast(u)] + graph[@intCast(u)][v] < dist[v])
            {
                dist[v] = dist[@intCast(u)] + graph[@intCast(u)][v];
            }
        }
    }

    return dist;
}
