import gleam/list
import gleam/pair

pub fn drop(list: List(a), n: Int) -> List(a) {
  list
  |> list.index_map(fn(x, i) { #(x, { i + 1 } % n != 0) })
  |> list.filter(fn(p) { pair.second(p) })
  |> list.map(fn(p) { pair.first(p) })
}
