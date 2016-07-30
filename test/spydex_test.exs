defmodule SpydexTest do
  use ExUnit.Case
  doctest Spydex
  alias Spydex
  alias HtmlFactory

  setup_all do
    fake_result = 
      {
        "http://test.com",
        %{body: HtmlFactory.simple}
      } |> Spydex.package
    {:ok, fake_result: fake_result}
  end

  test "parse - returns map with body", context do
    assert context[:fake_result].body |> is_binary
  end

  test "parse - returns title in map", context do
    assert context[:fake_result].title == "danbickford.me"
  end

  test "h1 - returns list of h1 tags", context do
    assert context[:fake_result].h1 
    == ["<h1>foo</h1>", "<h1 style='color:black'>foo</h1>"]
  end
  
end
