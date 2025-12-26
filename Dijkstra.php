<?php

define("INF", PHP_INT_MAX);

function dijkstra($graph, $start) {
    $n = count($graph);
    $dist = array_fill(0, $n, INF);
    $visited = array_fill(0, $n, false);

    $dist[$start] = 0;

    for ($i = 0; $i < $n - 1; $i++) {
        $min = INF;
        $u = -1;

        // Trouver le sommet non visité avec la distance minimale
        for ($j = 0; $j < $n; $j++) {
            if (!$visited[$j] && $dist[$j] < $min) {
                $min = $dist[$j];
                $u = $j;
            }
        }

        if ($u == -1) break;

        $visited[$u] = true;

        // Mise à jour des distances
        for ($v = 0; $v < $n; $v++) {
            if (
                !$visited[$v] &&
                $graph[$u][$v] != 0 &&
                $dist[$u] != INF &&
                $dist[$u] + $graph[$u][$v] < $dist[$v]
            ) {
                $dist[$v] = $dist[$u] + $graph[$u][$v];
            }
        }
    }

    return $dist;
}

// Exemple d'utilisation
$graph = [
    [0, 5, 0, 0, 2],
    [5, 0, 3, 0, 0],
    [0, 3, 0, 7, 0],
    [0, 0, 7, 0, 4],
    [2, 0, 0, 4, 0]
];

$start = 0;
$distances = dijkstra($graph, $start);

echo "Distances depuis le sommet $start\n";
foreach ($distances as $i => $d) {
    echo "Vers $i : $d\n";
}
