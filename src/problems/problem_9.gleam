import gleam/list

pub fn pack(list: List(a)) -> List(List(a)) {
  case list {
    [] -> []
    _ -> aggregate([], [], list) |> list.reverse
  }
}

fn aggregate(
  current: List(a),
  acc: List(List(a)),
  remaining: List(a),
) -> List(List(a)) {
  case remaining {
    [] -> []
    [x] -> [[x, ..current], ..acc]
    [a, ..rest] -> {
      case rest {
        [b, ..] if a == b -> [a, ..current] |> aggregate(acc, rest)
        [b, ..] if a != b -> [[a, ..current], ..acc] |> aggregate([], _, rest)
        _ -> [[a, ..current], ..acc]
      }
    }
  }
}
