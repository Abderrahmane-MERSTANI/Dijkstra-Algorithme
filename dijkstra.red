INF: 1000000

dijkstra: func [graph start][
    n: length? graph
    dist: array n INF
    visited: array n false

    dist/:start: 0

    repeat i n - 1 [
        min: INF
        u: none

        ; Trouver le sommet non visité avec la distance minimale
        repeat j n [
            if all [
                not visited/:j
                dist/:j < min
            ][
                min: dist/:j
                u: j
            ]
        ]

        if none? u [break]
        visited/:u: true

        ; Mise à jour des distances
        repeat v n [
            if all [
                not visited/:v
                graph/:u/:v <> 0
                dist/:u + graph/:u/:v < dist/:v
            ][
                dist/:v: dist/:u + graph/:u/:v
            ]
        ]
    ]
    dist
]

graph: [
    [0 4 0 0 2]
    [4 0 3 0 0]
    [0 3 0 5 0]
    [0 0 5 0 1]
    [2 0 0 1 0]
]

print dijkstra graph 1
