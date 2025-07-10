import gleam/list

pub fn rand_select(list: List(a), n: Int) -> List(a) {
  list.sample(list, n)
}
