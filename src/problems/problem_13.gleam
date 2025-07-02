import gleam/list
import gleam/pair

pub type Rle(a) {
  One(a)
  Many(Int, a)
}

pub fn encode(list: List(a)) -> List(Rle(a)) {
  case list {
    [] -> []
    [first, ..rest] -> enc(rest, first, 1, []) |> convert_rle_list
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

fn convert_rle_list(list: List(#(Int, a))) -> List(Rle(a)) {
  list
  |> list.map(fn(pair) { convert_rle(pair.first(pair), pair.second(pair)) })
}

fn convert_rle(count: Int, element: a) -> Rle(a) {
  case count > 1 {
    True -> Many(count, element)
    False -> One(element)
  }
}
