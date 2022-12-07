let lines = List.ofSeq(System.IO.File.ReadLines("day3Data"))


let findCommon (l : string list) = 
   let asSet (i:int) =
     Set.ofList(Seq.toList (List.nth l i))

   let ab = Set.intersect (asSet 0) (asSet 1)
   let abc= Set.intersect ab (asSet 2)
   Set.minElement abc

let value (c:char) = 
  let a = int c
  if a >= 65 && a < 91 then
    a - 64 + 26
  else
    a - 96

printfn "%i" (lines |> List.chunkBySize 3 |> List.map findCommon |> List.map value |> List.sum)


