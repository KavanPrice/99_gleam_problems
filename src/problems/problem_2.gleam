pub fn last_two(list: List(a)) -> Result(#(a,a), Nil) {
  case list {
    [] | [_] -> Error(Nil)
    [x, y] -> Ok(#(x, y))
    [_, ..tail] -> last_two(tail)
  }
}
