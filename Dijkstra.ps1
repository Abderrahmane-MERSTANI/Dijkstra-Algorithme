$INF = 1000000

function Dijkstra($graph, $start) {
    $n = $graph.Count
    $dist = @()
    $visited = @()

    for ($i = 0; $i -lt $n; $i++) {
        $dist += $INF
        $visited += $false
    }

    $dist[$start] = 0

    for ($i = 0; $i -lt $n - 1; $i++) {
        $min = $INF
        $u = -1

        # Trouver le sommet non visité avec la distance minimale
        for ($j = 0; $j -lt $n; $j++) {
            if (-not $visited[$j] -and $dist[$j] -lt $min) {
                $min = $dist[$j]
                $u = $j
            }
        }

        if ($u -eq -1) { break }
        $visited[$u] = $true

        # Mise à jour des distances
        for ($v = 0; $v -lt $n; $v++) {
            if (-not $visited[$v] -and $graph[$u][$v] -ne 0 `
                -and $dist[$u] + $graph[$u][$v] -lt $dist[$v]) {
                $dist[$v] = $dist[$u] + $graph[$u][$v]
            }
        }
    }

    return $dist
}

$graph = @(
    @(0, 4, 0, 0, 2),
    @(4, 0, 3, 0, 0),
    @(0, 3, 0, 5, 0),
    @(0, 0, 5, 0, 1),
    @(2, 0, 0, 1, 0)
)

Dijkstra $graph 0
