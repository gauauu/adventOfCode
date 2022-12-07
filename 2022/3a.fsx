let lines = List.ofSeq(System.IO.File.ReadLines("day3Data"))

let splitListAt n (list : string) =
    let firstList = list |> Seq.take n |> Seq.toList
    let secondList = list |> Seq.skip n |> Seq.toList
    (firstList, secondList)

let intersect x y = Set.intersect (Set.ofList x) (Set.ofList y)

let value (c:char) = 
  let a = int c
  if a >= 65 && a < 91 then
    a - 64 + 26
  else
    a - 96

let toPriorityScore (line:string) =
  let (a,b) = splitListAt (line.Length / 2) line
  let common = intersect a b
  //printfn "%c" (Set.minElement common)
  //printfn "%i" (common |> Set.minElement |> value)
  (common |> Set.minElement |> value)



let scored = List.map toPriorityScore lines

printfn "%i" (scored |> List.sum)
