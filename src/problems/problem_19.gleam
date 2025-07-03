import gleam/list

pub fn rotate(list: List(a), n: Int) -> List(a) {
  let start = list |> list.drop(n)
  let end = list |> list.take(n)
  list.append(start, end)
}
