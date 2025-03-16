import gleam/list

pub fn rev(list: List(a)) -> List(a) {
  case list {
    [] -> []
    [x, ..tail] -> list.append(rev(tail), [x])
  }
}
