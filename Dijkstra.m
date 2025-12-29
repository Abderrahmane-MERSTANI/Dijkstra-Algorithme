function dist = dijkstra(graph, start)
    n = size(graph, 1);
    INF = inf;

    dist = INF * ones(1, n);
    visited = false(1, n);

    dist(start) = 0;

    for i = 1:n-1
        minDist = INF;
        u = -1;

        % Trouver le sommet non visité avec la distance minimale
        for j = 1:n
            if ~visited(j) && dist(j) < minDist
                minDist = dist(j);
                u = j;
            end
        end

        if u == -1
            break;
        end

        visited(u) = true;

        % Mise à jour des distances
        for v = 1:n
            if ~visited(v) && graph(u, v) ~= 0 && dist(u) + graph(u, v) < dist(v)
                dist(v) = dist(u) + graph(u, v);
            end
        end
    end
end

% Exemple d'utilisation
graph = [
    0 3 0 0 5;
    3 0 2 0 0;
    0 2 0 4 0;
    0 0 4 0 1;
    5 0 0 1 0
];

start = 1;
distances = dijkstra(graph, start);

disp(['Distances depuis le sommet ', num2str(start)]);
disp(distances);
