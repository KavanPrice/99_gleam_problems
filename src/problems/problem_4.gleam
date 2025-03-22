pub fn length(list: List(a)) -> Int {
  case list {
    [] -> 0
    [_, ..tail] -> 1 + length(tail)
  }
}
