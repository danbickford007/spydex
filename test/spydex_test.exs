defmodule SpydexTest do
  use ExUnit.Case
  doctest Spydex
  alias Spydex

  test "start - returns map with body" do
    result = "http://www.danbickford.com" |> Spydex.start
    assert result.body |> is_binary
  end

  test "start - returns title in map" do
    result = "http://www.danbickford.com" |> Spydex.start
    assert result.title == "danbickford.me"
  end

end
