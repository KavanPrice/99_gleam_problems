import gleeunit
import gleeunit/should
import problems/problem_1
import problems/problem_10
import problems/problem_11
import problems/problem_12
import problems/problem_2
import problems/problem_3
import problems/problem_4
import problems/problem_5
import problems/problem_6
import problems/problem_7
import problems/problem_8
import problems/problem_9

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

pub fn at_test() {
  problem_3.at(2, ["a", "b", "c", "d", "e"])
  |> should.equal(Ok("c"))

  problem_3.at(2, ["a"])
  |> should.equal(Error(Nil))
}

pub fn length_test() {
  problem_4.length(["a", "b", "c"])
  |> should.equal(3)

  problem_4.length([])
  |> should.equal(0)
}

pub fn rev_test() {
  problem_5.rev(["a", "b", "c"])
  |> should.equal(["c", "b", "a"])
}

pub fn is_palindrome_test() {
  problem_6.is_palindrome(["x", "a", "m", "a", "x"])
  |> should.equal(True)

  problem_6.is_palindrome(["a", "b"])
  |> should.equal(False)
}

pub fn flatten_test() {
  let input = [
    problem_7.One("a"),
    problem_7.Many([
      problem_7.One("b"),
      problem_7.Many([problem_7.One("c"), problem_7.One("d")]),
      problem_7.One("e"),
    ]),
  ]

  problem_7.flatten(input)
  |> should.equal(["a", "b", "c", "d", "e"])
}

pub fn compress_test() {
  problem_8.compress([
    "a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e",
  ])
  |> should.equal(["a", "b", "c", "a", "d", "e"])
}

pub fn pack_test() {
  problem_9.pack([
    "a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "d", "e", "e", "e", "e",
  ])
  |> should.equal([
    ["a", "a", "a", "a"],
    ["b"],
    ["c", "c"],
    ["a", "a"],
    ["d", "d"],
    ["e", "e", "e", "e"],
  ])
}

pub fn encode_test() {
  problem_10.encode([
    "a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e",
  ])
  |> should.equal([
    #(4, "a"),
    #(1, "b"),
    #(2, "c"),
    #(2, "a"),
    #(1, "d"),
    #(4, "e"),
  ])
}

pub fn modified_encode_test() {
  problem_11.encode([
    "a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e",
  ])
  |> should.equal([
    problem_11.Many(4, "a"),
    problem_11.One("b"),
    problem_11.Many(2, "c"),
    problem_11.Many(2, "a"),
    problem_11.One("d"),
    problem_11.Many(4, "e"),
  ])
}

pub fn decode_test() {
  problem_12.decode([
    problem_12.Many(4, "a"),
    problem_12.One("b"),
    problem_12.Many(2, "c"),
    problem_12.Many(2, "a"),
    problem_12.One("d"),
    problem_12.Many(4, "e"),
  ])
  |> should.equal([
    "a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e",
  ])
}
