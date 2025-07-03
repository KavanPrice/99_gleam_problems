import gleam/list

pub fn remove_at(index: Int, list: List(a)) -> List(a) {
  let start = list |> list.take(index)
  let end = list |> list.drop(index + 1)
  list.append(start, end)
}
