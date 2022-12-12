open System.Text.RegularExpressions

let input = List.ofSeq (System.IO.File.ReadLines("day10Data"))

type State =
  { x: int
    cycle: int
    pixels:  int array}

let initial = {x = 1
               cycle = 0
               pixels =  Array.zeroCreate 400}


let updatePixel cycle x pixels =
  let v = (cycle - 1) % 40
  if (v < x - 1) || (v > x + 1) then
    pixels
  else
    Array.set pixels cycle 1
    pixels

let logPixel (oldState: State) (newState: State) =
  let applyCurrent = {newState with pixels = updatePixel newState.cycle oldState.x newState.pixels}
  if newState.cycle = oldState.cycle + 1 then
    //just newState.cycle
    applyCurrent
  else
    //log newState.cycle and newState.cycle - 1
    {newState with pixels = updatePixel (newState.cycle - 1) oldState.x applyCurrent.pixels}


let nextState state (line:string) =
  logPixel state
    (match line with
    | "noop" -> {state with cycle = state.cycle + 1}
    | _ -> {state with cycle = state.cycle + 2;
                       x = state.x + (int (line.Split(" ")[1]))}
     )

let result = (List.fold nextState initial input).pixels


let printArrLine result =
  (List.ofArray result) |> List.map (fun i -> if i = 0 then " " else "#") |> List.map (printf "%s")
  printfn ""
  1

printfn "*--------------------------------------*"

printArrLine (Array.sub result 1 40)
printArrLine (Array.sub result 41 40)
printArrLine (Array.sub result 81 40)
printArrLine (Array.sub result 121 40)
printArrLine (Array.sub result 161 40)
printArrLine (Array.sub result 201 40)

