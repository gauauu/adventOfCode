

let lines = List.ofSeq(System.IO.File.ReadLines("day6Data"))

let initial = Seq.toList(List.head lines)

let checkFirst letters =
  (letters |> List.take 4 |> Set.ofList |> Set.count) = 4

let findFirst letters =
  let rec loop letters index =
    if checkFirst letters then
      index
    else
      loop (List.tail letters) (index + 1)
  loop letters 0

printfn "%i" ((findFirst initial) + 4)


