import gleam/list

pub type Rle(a) {
  One(a)
  Many(Int, a)
}

pub fn decode(list: List(Rle(a))) -> List(a) {
  case list {
    [] -> []
    [next, ..rest] -> list.append(convert_rle(next), decode(rest))
  }
}

fn convert_rle(rle: Rle(a)) -> List(a) {
  case rle {
    Many(count, val) -> list.repeat(val, times: count)
    One(val) -> [val]
  }
}
