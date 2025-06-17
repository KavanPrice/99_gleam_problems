import gleam/list

pub fn encode(list: List(a)) -> List(#(Int, a)) {
  case list {
    [] -> []
    [first, ..rest] -> enc(rest, first, 1, [])
  }
}

fn enc(
  remaining: List(a),
  current: a,
  count: Int,
  acc: List(#(Int, a)),
) -> List(#(Int, a)) {
  case remaining {
    [] -> list.reverse([#(count, current), ..acc])
    [next, ..rest] -> {
      case next == current {
        True -> enc(rest, current, count + 1, acc)
        False -> enc(rest, next, 1, [#(count, current), ..acc])
      }
    }
  }
}
