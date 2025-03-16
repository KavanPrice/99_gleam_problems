import gleeunit
import gleeunit/should
import gleam/option.{Some, None}
import problems/problem_1

pub fn main() {
  gleeunit.main()
}

pub fn last_test() {
  problem_1.last(["a", "b", "c", "d"])
  |> should.equal(Some("d"))

  problem_1.last([])
  |> should.equal(None)
}
