import gleam/list

pub fn at(index: Int, list: List(a)) -> Result(a, Nil) {
  case index == 0 {
    True -> list.first(list)
    False -> {
      case list.rest(list) {
        Ok(rest) -> at(index - 1, rest)
        Error(_) -> Error(Nil)
      }
    }
  }
}
