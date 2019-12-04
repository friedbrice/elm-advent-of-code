module Day01 exposing (solve)

solve : String -> (String, String)
solve input = (solvePart1 input, solvePart2 input)

parseInput : String -> List Int
parseInput input =
  -- `x |> f' is just another way to write `f x`,
  -- but it's convenient because it lets you chain
  -- function calls, like i've done below.
  input
    |> String.split "\n"
    |> List.filterMap String.toInt

solvePart1 : String -> String
solvePart1 input =
  let
    modules = parseInput input
    fuelPerModule mass = mass // 3 - 2
    totalFuel =
      modules
        |> List.map fuelPerModule
        |> List.sum
  in
  String.fromInt totalFuel

solvePart2 : String -> String
solvePart2 input = "<NOT_IMPLEMENTED>"

-- Hint for part 2: Add the fuel needed for your new fuel.
actualFuelPerModule : Int -> Int
actualFuelPerModule mass =
  let
    newFuel = max 0 (mass // 3 - 2)
    andThenSome =
      if newFuel > 0
        then actualFuelPerModule newFuel
        else 0
  in
  newFuel + andThenSome
