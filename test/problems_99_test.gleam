import gleeunit
import gleeunit/should
import problems/problem_1
import problems/problem_2
import problems/problem_3

pub fn main() {
  gleeunit.main()
}

pub fn last_test() {
  problem_1.last(["a", "b", "c", "d"])
  |> should.equal(Ok("d"))

  problem_1.last([])
  |> should.equal(Error(Nil))
}

pub fn last_two_test() {
  problem_2.last_two(["a", "b", "c", "d"])
  |> should.equal(Ok(#("c", "d")))

  problem_2.last_two(["a"])
  |> should.equal(Error(Nil))
}
pub fn at_example_test() {
  problem_3.at(2, ["a", "b", "c", "d", "e"])
  |> should.equal(Ok("c"))

  problem_3.at(2, ["a"])
  |> should.equal(Error(Nil))
}
