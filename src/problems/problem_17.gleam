import gleam/list

pub fn split(list: List(a), n: Int) -> #(List(a), List(a)) {
  list.split(list, n)
}
