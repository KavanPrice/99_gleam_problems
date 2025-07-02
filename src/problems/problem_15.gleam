import gleam/list

pub fn replicate(list: List(a), times: Int) -> List(a) {
  list
  |> list.flat_map(fn(x) { list.repeat(x, times) })
}
