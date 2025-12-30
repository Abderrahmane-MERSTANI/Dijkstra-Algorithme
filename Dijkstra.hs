import Data.List (minimumBy)
import Data.Ord (comparing)

type Graph = [[Int]]
type Distance = Int

inf :: Int
inf = maxBound `div` 2

dijkstra :: Graph -> Int -> [Distance]
dijkstra graph start = dijkstra' initialDist initialVisited
  where
    n = length graph
    initialDist = [if i == start then 0 else inf | i <- [0..n-1]]
    initialVisited = replicate n False

    dijkstra' dist visited
      | all id visited = dist
      | otherwise =
          let u = minimumBy (comparing (dist !!))
                  [i | i <- [0..n-1], not (visited !! i)]
              visited' = update visited u True
              dist' = foldl (relax u) dist [0..n-1]
          in dijkstra' dist' visited'

    relax u d v
      | visited !! v = d
      | graph !! u !! v == 0 = d
      | d !! u + graph !! u !! v < d !! v =
          update d v (d !! u + graph !! u !! v)
      | otherwise = d

    update xs i val =
      take i xs ++ [val] ++ drop (i + 1) xs

main :: IO ()
main = do
  let graph =
        [ [0, 4, 0, 0, 6]
        , [4, 0, 2, 0, 0]
        , [0, 2, 0, 5, 0]
        , [0, 0, 5, 0, 3]
        , [6, 0, 0, 3, 0]
        ]

  let start = 0
  let distances = dijkstra graph start

  putStrLn ("Distances depuis le sommet " ++ show start)
  mapM_ (\(i,d) -> putStrLn ("Vers " ++ show i ++ " : " ++ show d))
        (zip [0..] distances)
