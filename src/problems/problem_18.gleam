import gleam/list

pub fn slice(list: List(a), from: Int, to: Int) -> List(a) {
  list
  |> list.drop(from)
  |> list.take(to - from + 1)
}
