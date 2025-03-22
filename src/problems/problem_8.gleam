import gleam/list

pub fn compress(list: List(a)) -> List(a) {
  case list {
    [] -> []
    [x] -> [x]
    [x, y, ..tail] -> {
      case x == y {
        True -> list.append([y], tail) |> compress
        False -> list.append([y], tail) |> compress |> list.append([x], _)
      }
    }
  }
}
