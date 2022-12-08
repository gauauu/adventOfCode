open System.Text.RegularExpressions

let input = List.ofSeq (System.IO.File.ReadLines("day8Data"))
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
      size: int
      total: int}

let newNode newName =
    { name = newName
      children = []
      size = 0
      total = 0
    }

let rec addDirTo currentDir (n: Node) (newDir: string) =
    let newFullDir = (List.head currentDir) + "/" + newDir
    if n.name = List.head currentDir then
        { name = n.name
          children = (newNode newFullDir) :: n.children
          size = n.size
          total = 0}
    else
        { name = n.name
          children = List.map (fun child -> addDirTo currentDir child newDir) n.children
          size = n.size
          total = 0 }

let rec addFileTo currentDir (n: Node) (fileSize: int) =
    if n.name = List.head currentDir then
        // printfn "Adding %i to %s" fileSize (List.head currentDir)
        { n with size = n.size + fileSize }
    else
        { n with children = List.map (fun child -> addFileTo currentDir child fileSize) n.children }

type State = { dir: (string list); node: Node }

let changeDirectory (state: State) (line: string) =
    let newDir = line.Split("cd ")[1]
    if newDir = ".." then
        {state with dir = (List.tail state.dir)}
    else
        let newFullDir = List.head state.dir + "/" + newDir
        { state with dir = newFullDir :: state.dir }

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
          node = { name = "/"; children = []; size = 0; total = 0 } }
        lines

let rec totalSize (node: Node) =
    let childrenSize = List.map totalSize node.children
    node.size + List.sum childrenSize

let rec addTotals (node: Node) =
    let result =
        { node with
            total = (totalSize node)
            children = (List.map addTotals node.children) }

    // printfn "%s: %i" result.name result.size
    result

let rec totalOver max soFar (node: Node) =
    let result = List.fold (totalOver max) 0 node.children

    if node.total <= max then
        // printfn "including %s as %i + %i = %i" node.name node.total result (node.total + result)
        (soFar + node.total + result)
    else
        // printfn "discrading %s so %i" node.name result
        (soFar + result)

printfn "%O" (addTotals parsedDirs.node)
printfn "%i" (totalOver 100000 0 (addTotals parsedDirs.node))


