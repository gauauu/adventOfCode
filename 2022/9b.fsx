open System.Text.RegularExpressions

let input = List.ofSeq (System.IO.File.ReadLines("day9Data"))


let expandCommand commandList (line:string) =
    let parts = line.Split(" ")
    let command = parts[0]
    let amount = int parts[1]
    {1..amount} |> Seq.fold (fun r i -> r @ [command]) commandList

let commands = List.fold expandCommand [] input

let head = (0, 0)
let tail = (0, 0)

let positions = Set.empty.Add(tail)

let rope = [head;head;head;head;head;head;head;head;head;head]
let state = (rope, positions)

let applyCommand head (command: string) =
    let (x, y) = head
    match command with
    | "R" -> (x + 1, y)
    | "L" -> (x - 1, y)
    | "U" -> (x, y - 1)
    | "D" -> (x, y + 1)


let chaseHead head tail =
    let (hx,hy) = head
    let (tx,ty) = tail
    let dx = hx - tx
    let dy = hy - ty
    //diagonal is no movement
    let adx = abs dx
    let ady = abs dy
    let sx = sign dx
    let sy = sign dy
    if (adx <= 1) && (ady <= 1) then
        tail
    else
        (tx + sx, ty + sy)
    
let last list = list |> List.rev |> List.head

let nextState state command =
    let (rope, (positions: Set<int * int>)) = state
    let newHead = applyCommand (List.head rope) command
    let newRope = List.fold (fun previous knot -> previous @ [chaseHead (last previous) knot]) [newHead] (List.tail rope)
    (newRope, positions.Add(last newRope))

let result = List.fold nextState state commands

let (_,final) = result
Set.count final
