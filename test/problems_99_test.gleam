import gleeunit
import gleeunit/should
import gleam/option.{Some, None}
import problems/problem_1
import problems/problem_2

pub fn main() {
  gleeunit.main()
}

pub fn last_test() {
  problem_1.last(["a", "b", "c", "d"])
  |> should.equal(Some("d"))

  problem_1.last([])
  |> should.equal(None)
}

pub fn last_two_test() {
  problem_2.last_two(["a", "b", "c", "d"])
  |> should.equal(Some(#("c", "d")))

  problem_2.last_two(["a"])
  |> should.equal(None)
}
