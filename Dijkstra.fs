let INF = 1_000_000

let dijkstra (graph:int[,]) start =
    let n = graph.GetLength(0)
    let dist = Array.create n INF
    let visited = Array.create n false

    dist[start] <- 0

    for _ in 0 .. n - 2 do
        let mutable minDist = INF
        let mutable u = -1

        // Trouver le sommet non visité avec la distance minimale
        for i in 0 .. n - 1 do
            if not visited[i] && dist[i] < minDist then
                minDist <- dist[i]
                u <- i

        if u <> -1 then
            visited[u] <- true

            // Mise à jour des distances
            for v in 0 .. n - 1 do
                if not visited[v] && graph[u, v] <> 0 &&
                   dist[u] + graph[u, v] < dist[v] then
                    dist[v] <- dist[u] + graph[u, v]

    dist

[<EntryPoint>]
let main _ =
    let graph = array2D [
        [0; 4; 0; 0; 2]
        [4; 0; 3; 0; 0]
        [0; 3; 0; 5; 0]
        [0; 0; 5; 0; 1]
        [2; 0; 0; 1; 0]
    ]

    let result = dijkstra graph 0
    printfn "%A" result
    0
