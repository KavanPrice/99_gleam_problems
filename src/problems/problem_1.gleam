import gleam/option.{Some, None, type Option}

pub fn last(list: List(a)) -> Option(a) {
  case list {
    [] -> None
    [x] -> Some(x)
    [_, ..tail] -> last(tail)
  }
}
