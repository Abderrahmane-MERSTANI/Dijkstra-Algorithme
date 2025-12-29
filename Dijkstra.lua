local INF = math.huge

function dijkstra(graph, start)
    local n = #graph
    local dist = {}
    local visited = {}

    -- Initialisation
    for i = 1, n do
        dist[i] = INF
        visited[i] = false
    end

    dist[start] = 0

    for _ = 1, n - 1 do
        local minDist = INF
        local u = -1

        -- Trouver le sommet non visité avec la distance minimale
        for i = 1, n do
            if not visited[i] and dist[i] < minDist then
                minDist = dist[i]
                u = i
            end
        end

        if u == -1 then break end

        visited[u] = true

        -- Mise à jour des distances
        for v = 1, n do
            if not visited[v] and graph[u][v] ~= 0
               and dist[u] + graph[u][v] < dist[v] then
                dist[v] = dist[u] + graph[u][v]
            end
        end
    end

    return dist
end

-- Exemple d'utilisation
local graph = {
    {0, 3, 0, 0, 5},
    {3, 0, 2, 0, 0},
    {0, 2, 0, 4, 0},
    {0, 0, 4, 0, 1},
    {5, 0, 0, 1, 0}
}

local start = 1
local distances = dijkstra(graph, start)

print("Distances depuis le sommet " .. start)
for i = 1, #distances do
    print("Vers " .. i .. " : " .. distances[i])
end
