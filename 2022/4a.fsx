let lines = List.ofSeq(System.IO.File.ReadLines("day4Data"))

let range (str : string) =
  let parts = str.Split("-")
  Set.ofSeq (seq { (parts[0] |> int) .. (parts[1] |> int) })

let forBoth f (line: string) = 
  let parts = line.Split(",")
  (f parts[0], f parts[1])

let isFull setPair =
  let (first, second) = setPair
  let both = Set.intersect first second
  ((Set.count first) = (Set.count both) ||
   (Set.count second) = (Set.count both))


let ranges = List.map (forBoth range) lines

printfn "%i" (ranges |> List.filter isFull |> List.length)

