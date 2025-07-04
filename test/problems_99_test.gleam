import gleeunit
import gleeunit/should
import problems/problem_1
import problems/problem_10
import problems/problem_11
import problems/problem_12
import problems/problem_13
import problems/problem_14
import problems/problem_15
import problems/problem_16
import problems/problem_17
import problems/problem_18
import problems/problem_19
import problems/problem_2
import problems/problem_20
import problems/problem_21
import problems/problem_22
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

pub fn direct_encode_test() {
  problem_13.encode([
    "a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e",
  ])
  |> should.equal([
    problem_13.Many(4, "a"),
    problem_13.One("b"),
    problem_13.Many(2, "c"),
    problem_13.Many(2, "a"),
    problem_13.One("d"),
    problem_13.Many(4, "e"),
  ])
}

pub fn duplicate_test() {
  problem_14.duplicate(["a", "b", "c", "c", "d"])
  |> should.equal(["a", "a", "b", "b", "c", "c", "c", "c", "d", "d"])
}

pub fn replicate_test() {
  problem_15.replicate(["a", "b", "c"], 3)
  |> should.equal(["a", "a", "a", "b", "b", "b", "c", "c", "c"])
}

pub fn drop_test() {
  problem_16.drop(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"], 3)
  |> should.equal(["a", "b", "d", "e", "g", "h", "j"])
}

pub fn split_test() {
  problem_17.split(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"], 3)
  |> should.equal(#(["a", "b", "c"], ["d", "e", "f", "g", "h", "i", "j"]))
  problem_17.split(["a", "b", "c", "d"], 5)
  |> should.equal(#(["a", "b", "c", "d"], []))
}

pub fn slice_test() {
  problem_18.slice(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"], 2, 6)
  |> should.equal(["c", "d", "e", "f", "g"])
}

pub fn rotate_test() {
  problem_19.rotate(["a", "b", "c", "d", "e", "f", "g", "h"], 3)
  |> should.equal(["d", "e", "f", "g", "h", "a", "b", "c"])
}

pub fn remove_at_test() {
  problem_20.remove_at(1, ["a", "b", "c", "d"])
  |> should.equal(["a", "c", "d"])
}

pub fn insert_at_test() {
  problem_21.insert_at("alfa", 1, ["a", "b", "c", "d"])
  |> should.equal(["a", "alfa", "b", "c", "d"])
}

pub fn range_test() {
  problem_22.range(4, 9)
  |> should.equal([4, 5, 6, 7, 8, 9])
}
