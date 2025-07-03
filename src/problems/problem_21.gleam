import gleam/list

pub fn insert_at(element: a, index: Int, list: List(a)) -> List(a) {
  let start = list |> list.take(index)
  let end = list |> list.drop(index)
  list.append(start, [element]) |> list.append(end)
}
