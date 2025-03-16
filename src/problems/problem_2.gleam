import gleam/option.{Some, None, type Option}

pub fn last_two(list: List(a)) -> Option(#(a,a)) {
  case list {
    [] | [_] -> None
    [x, y] -> Some(#(x, y))
    [_, ..tail] -> last_two(tail)
  }
}
