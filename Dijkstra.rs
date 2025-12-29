use std::i32;

const INF: i32 = i32::MAX;

fn dijkstra(graph: Vec<Vec<i32>>, start: usize) -> Vec<i32> {
    let n = graph.len();
    let mut dist = vec![INF; n];
    let mut visited = vec![false; n];

    dist[start] = 0;

    for _ in 0..n - 1 {
        let mut min = INF;
        let mut u: Option<usize> = None;

        // Trouver le sommet non visité avec la distance minimale
        for i in 0..n {
            if !visited[i] && dist[i] < min {
                min = dist[i];
                u = Some(i);
            }
        }

        let u = match u {
            Some(v) => v,
            None => break,
        };

        visited[u] = true;

        // Mettre à jour les distances des voisins
        for v in 0..n {
            if !visited[v]
                && graph[u][v] != 0
                && dist[u] != INF
                && dist[u] + graph[u][v] < dist[v]
            {
                dist[v] = dist[u] + graph[u][v];
            }
        }
    }

    dist
}

fn main() {
    let graph = vec![
        vec![0, 7, 0, 0, 3],
        vec![7, 0, 1, 2, 0],
        vec![0, 1, 0, 6, 0],
        vec![0, 2, 6, 0, 4],
        vec![3, 0, 0, 4, 0],
    ];

    let start = 0;
    let distances = dijkstra(graph, start);

    println!("Distances depuis le sommet {}", start);
    for (i, d) in distances.iter().enumerate() {
        println!("Vers {} : {}", i, d);
    }
}
