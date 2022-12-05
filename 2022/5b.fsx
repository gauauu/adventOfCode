open System.Text.RegularExpressions

let lines = List.ofSeq(System.IO.File.ReadLines("day5Data"))

let splitPoint = List.findIndex (fun(x) -> x = "") lines

let initialStackLines = List.take (splitPoint - 1) lines |> List.rev
let commands = List.skip (splitPoint+1) lines

let appendNested (stacks : char list list) input =
  let index, value = input
  if value = ' ' then
    stacks
  else if index >= List.length stacks then 
    stacks @ [[value]]
  else
    List.mapi (fun k (old : char list)-> if k = index then (value :: old) else old) stacks


let addStackLine stacks (line : string) =
  let chunked = List.chunkBySize 4 (Seq.toList line) |> List.map (fun c -> List.nth c 1)
  let range = seq {0 .. (List.length chunked) - 1} |> List.ofSeq
  let input = List.zip range chunked 
  List.fold appendNested stacks input

let initialStack = List.fold addStackLine [] initialStackLines

let popFrom index count stacks =
  List.mapi (fun i stack -> if i = index then List.skip count stack else stack) stacks

let pushTo index value stacks =
  List.mapi (fun i stack -> if i = index then value @ stack else stack) stacks


let move (stacks : char list list) from dest count =
  let toMove = List.nth stacks from |> List.take count
  let result = popFrom from count stacks |> pushTo dest toMove
  printfn "%O" result
  result



let processMove (stacks : char list list) line =
  let r = new Regex("move (\d+) from (\d) to (\d)")
  let m = r.Match line
  let count = (int (string m.Groups[1]))
  let from =  (int (string m.Groups[2])) - 1
  let dest =  (int (string m.Groups[3])) - 1
  printfn "%i %i %i" count from dest
  let result = move stacks from dest count
  printfn "ok"
  result




let finalState = List.fold processMove initialStack commands


printfn "%O" (System.String.Concat(Array.ofList(finalState |> List.map List.head)))
