import gleam/list

pub type Node(a) {
  One(a)
  Many(List(Node(a)))
}

pub fn flatten(nodes: List(Node(a))) -> List(a) {
  case nodes {
    [] -> []
    [One(val), ..tail] -> list.append([val], flatten(tail))
    [Many(head_nodes), ..tail] -> list.append(head_nodes, tail) |> flatten
  }
}
