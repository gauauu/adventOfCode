open System.Text.RegularExpressions

let input = List.ofSeq (System.IO.File.ReadLines("day7Data"))
let start :: lines = input

let firstIsCommand (lines: string list) =
    match lines with
    | [] -> false
    | [ line ] -> line.StartsWith("$")
    | line :: rest -> line.StartsWith("$")

let commandOutput (output: string list) (lines: string list) =
    let rec loop output (lines: string list) =
        match lines with
        | [] -> output
        | _ ->
            if firstIsCommand lines then
                output
            else
                loop (output @ [ List.head lines ]) (List.tail lines)

    loop output lines

type Node =
    { name: string
      children: Node list
      size: int }

let newNode newName =
    { name = newName
      children = []
      size = 0 }

let rec addDirTo currentDir (n: Node) (newDir: string) =
    if n.name = List.head currentDir then
        { name = n.name
          children = (newNode newDir) :: n.children
          size = n.size }
    else
        { name = n.name
          children = List.map (fun child -> addDirTo currentDir child newDir) n.children
          size = n.size }

let rec addFileTo currentDir (n: Node) (fileSize: int) =
    if n.name = List.head currentDir then
        printfn "Adding %i to %s" fileSize (List.head currentDir)
        { n with size = n.size + fileSize }
    else
        { n with children = List.map (fun child -> addFileTo currentDir child fileSize) n.children }

type State = { dir: (string list); node: Node }

let changeDirectory (state: State) (line: string) =
    let newDir = line.Split("cd ")[1]
    { state with dir = newDir :: state.dir }

let parseLine (state: State) (line: string) =
    if line.StartsWith("$ cd") then
        changeDirectory state line
    else if line.StartsWith("$") then
        state
    else if line.StartsWith("dir") then
        let newDir = line.Split(" ")[1]
        let (newNode: Node) = addDirTo state.dir state.node newDir
        { state with node = newNode }
    else
        let fileSize = line.Split(" ")[0] |> int
        { state with node = addFileTo state.dir state.node fileSize }


let parsedDirs =
    List.fold
        parseLine
        { dir = [ "/" ]
          node = { name = "/"; children = []; size = 0 } }
        lines
