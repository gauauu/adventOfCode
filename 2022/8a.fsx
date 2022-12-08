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

let rec isVisibleDir height x y dx dy =
    let nextX = x + dx
    let nextY = y + dy

    if isOffMap nextX nextY then
        true
    else
        ((heightOf nextX nextY) < height && isVisibleDir height nextX nextY dx dy)

let isVisible x y =
    let h = heightOf x y
    (isVisibleDir h x y 0 (-1))
    || (isVisibleDir h x y 0 1)
    || (isVisibleDir h x y 1 0)
    || (isVisibleDir h x y (-1) 0)

let visible x y =
    let result = if isVisible x y then 1 else 0
    result

let visibilityMap = List.mapi (fun y -> List.mapi (fun x item -> visible x y)) heights

List.sum (List.map List.sum visibilityMap)
