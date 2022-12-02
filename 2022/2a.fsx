let lines = List.ofSeq(System.IO.File.ReadLines("day2Data"))

let score throw =
  match throw with
  | "X" -> 1
  | "Y" -> 2
  | "Z" -> 3


let tie = 3
let lose = 0
let win = 6

let gamescore line = 
  match line with
  | "A X" -> score("X") + tie
  | "A Y" -> score("Y") + win
  | "A Z" -> score("Z") + lose
  | "B X" -> score("X") + lose
  | "B Y" -> score("Y") + tie
  | "B Z" -> score("Z") + win
  | "C X" -> score("X") + win
  | "C Y" -> score("Y") + lose
  | "C Z" -> score("Z") + tie

let resultthrow line =
  match line with
  | "A X" -> score("Z") + lose
  | "A Y" -> score("X") + tie
  | "A Z" -> score("Y") + win
  | "B X" -> score("X") + lose
  | "B Y" -> score("Y") + tie
  | "B Z" -> score("Z") + win
  | "C X" -> score("Y") + lose
  | "C Y" -> score("Z") + tie
  | "C Z" -> score("X") + win

printfn "%i" (lines |> List.map gamescore |> List.sum)
printfn "%i" (lines |> List.map resultthrow |> List.sum)

//A rock
//B Paper
//C scissors

//X Rock
//Y Paper
//Z scizzors

//X lose
//Y tie
//Z win
