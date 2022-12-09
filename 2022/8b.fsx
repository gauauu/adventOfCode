open System.Text.RegularExpressions

let input = List.ofSeq (System.IO.File.ReadLines("day8Data"))

let heights =
    List.map (fun line -> List.map (fun i -> int (string i)) (Seq.toList line)) input


let heightOf x y = List.item x (List.item y heights)

let isOffMap x y =
    let result = (x < 0
        || y < 0
        || y >= List.length heights
        || x >= List.length (List.head heights))
    result

let rec numVisibleDir height (ctr : int) x y dx dy =
    let nextX = x + dx
    let nextY = y + dy

    if isOffMap nextX nextY then
        ctr 
    else if ((heightOf nextX nextY) < height) then
        numVisibleDir height (ctr + 1) nextX nextY dx dy
    else
        ctr + 1

let numVisible x y =
    let h = heightOf x y
    (numVisibleDir h 0 x y 0 (-1))
    * (numVisibleDir h 0 x y 0 1)
    * (numVisibleDir h 0 x y 1 0)
    * (numVisibleDir h 0 x y (-1) 0)

let visibilityMap = List.mapi (fun y -> List.mapi (fun x item -> numVisible x y)) heights

List.max (List.map List.max visibilityMap)
