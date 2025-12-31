use strict;
use warnings;

use constant INF => 1_000_000_000;

sub dijkstra {
    my ($graph, $start) = @_;
    my $n = scalar @$graph;

    my @dist = (INF) x $n;
    my @visited = (0) x $n;

    $dist[$start] = 0;

    for (1 .. $n - 1) {
        my $min = INF;
        my $u = -1;

        # Trouver le sommet non visité avec la distance minimale
        for my $i (0 .. $n - 1) {
            if (!$visited[$i] && $dist[$i] < $min) {
                $min = $dist[$i];
                $u = $i;
            }
        }

        last if $u == -1;

        $visited[$u] = 1;

        # Mise à jour des distances
        for my $v (0 .. $n - 1) {
            if (
                !$visited[$v] &&
                $graph->[$u][$v] != 0 &&
                $dist[$u] + $graph->[$u][$v] < $dist[$v]
            ) {
                $dist[$v] = $dist[$u] + $graph->[$u][$v];
            }
        }
    }

    return @dist;
}

# Exemple d'utilisation
my @graph = (
    [0, 3, 0, 0, 5],
    [3, 0, 2, 0, 0],
    [0, 2, 0, 4, 0],
    [0, 0, 4, 0, 1],
    [5, 0, 0, 1, 0],
);

my $start = 0;
my @distances = dijkstra(\@graph, $start);

print "Distances depuis le sommet $start\n";
for my $i (0 .. $#distances) {
    print "Vers $i : $distances[$i]\n";
}
