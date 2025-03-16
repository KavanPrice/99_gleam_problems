pub fn last(list: List(a)) -> Result(a, Nil) {
  case list {
    [] -> Error(Nil)
    [x] -> Ok(x)
    [_, ..tail] -> last(tail)
  }
}
