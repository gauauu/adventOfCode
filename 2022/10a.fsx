open System.Text.RegularExpressions

let input = List.ofSeq (System.IO.File.ReadLines("day10Data"))

type State =
  { x: int
    cycle: int
    strength: int }

let initial = {x = 1
               cycle = 0
               strength = 0}

let scoreAt = [20; 60; 100; 140; 180; 220]

let logStrength (oldState: State) (newState: State) =
  let which = List.filter (fun i -> ((oldState.cycle < i) && (i <= newState.cycle))) scoreAt
  if List.length which > 0 then
    let matched = List.head which
    //if matched = newState.cycle then
    if false then
      let newS = newState.strength + (matched * newState.x)
      printfn "%i * %i = %i" matched newState.x newS
      {newState with strength=newS}
    else
      let newS = newState.strength + (matched * oldState.x)
      printfn "%i * %i = %i" matched oldState.x newS
      {newState with strength=newState.strength + (matched * oldState.x)}
  else
    newState
    

let nextState state (line:string) =
  printfn "%s     %i" line state.cycle
  logStrength state
    (match line with
    | "noop" -> {state with cycle = state.cycle + 1}
    | _ -> {state with cycle = state.cycle + 2;
                       x = state.x + (int (line.Split(" ")[1]))}
     )

let result = List.fold nextState initial input

printfn "%O" result.strength
