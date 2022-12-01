let lines = List.ofSeq(System.IO.File.ReadLines("day1Data"))

let summed result line =
  if line = "" then
    0 :: result
  else
    match result with
     |  current :: rest -> current + (line |> int) :: rest
     |  [] -> [line |> int]


List.fold summed [] lines |> List.sortDescending |> List.take(3) |> List.sum



