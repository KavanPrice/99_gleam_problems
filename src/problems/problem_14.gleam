import gleam/list

pub fn duplicate(list: List(a)) -> List(a) {
  list
  |> list.map(fn(x) { [x, x] })
  |> list.flatten
}
