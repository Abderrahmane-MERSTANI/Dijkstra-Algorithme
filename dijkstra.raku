my $INF = 1_000_000;
my $N = 5;

my @graph =
  [0, 4, 0, 0, 2],
  [4, 0, 3, 0, 0],
  [0, 3, 0, 5, 0],
  [0, 0, 5, 0, 1],
  [2, 0, 0, 1, 0];

my @dist = $INF xx $N;
my @visited = False xx $N;

@dist[0] = 0;  # sommet source

for 1 ..^ $N {
    my $min = $INF;
    my $u = -1;

    for 0 ..^ $N -> $i {
        if !@visited[$i] && @dist[$i] < $min {
            $min = @dist[$i];
            $u = $i;
        }
    }

    last if $u == -1;
    @visited[$u] = True;

    for 0 ..^ $N -> $v {
        if !@visited[$v] && @graph[$u][$v] != 0 &&
           @dist[$u] + @graph[$u][$v] < @dist[$v] {
            @dist[$v] = @dist[$u] + @graph[$u][$v];
        }
    }
}

say "Distances : @dist[]";
