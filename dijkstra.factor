USING: arrays math sequences prettyprint locals ;
IN: dijkstra

CONSTANT: INF 1000000

: min-distance ( dist visited -- u )
    INF -1
    dist length [0..)
    [| i |
        visited i nth not
        [ dist i nth dup ] [ drop INF ] if
    ] map-index
    [ second ] infimum-by first ;

: relax ( graph dist visited u -- dist )
    graph u nth
    dist visited u
    [| row dist visited u |
        row length [0..)
        [| v |
            visited v nth not
            row v nth 0 >
            and
            [ dist u nth row v nth + dist v nth < ]
            [ f ] if
            [ dist clone dup v dist u nth row v nth + set-nth ]
            [ dist ] if
        ] each
    ] call ;

: dijkstra ( graph start -- dist )
    dup length :> n
    n [ INF ] replicate :> dist
    n [ f ] replicate :> visited

    0 dist set-nth

    n 1 - [
        dist visited min-distance :> u
        visited clone u t set-nth to visited
        graph dist visited u relax to dist
    ] times

    dist ;

! Exemple
{
  { 0 4 0 0 2 }
  { 4 0 3 0 0 }
  { 0 3 0 5 0 }
  { 0 0 5 0 1 }
  { 2 0 0 1 0 }
} 0 dijkstra .
