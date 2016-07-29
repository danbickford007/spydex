defmodule SpydexTest do
  use ExUnit.Case
  doctest Spydex
  alias Spydex

  setup_all do
    real_result = "http://www.danbickford.com" |> Spydex.start 
    fake_result = """
      <html>
        <head>
          <title>Test</title>
        </head>
        <body>
          <a href="test">test</a>
          <h1>foo</h1>
          <a onclick='tester'>tester</a>
        </body>
      </html>
    """
    {:ok, real_result: real_result, fake_result: fake_result}
  end

  test "start - returns map with body", context do
    assert context[:real_result].body |> is_binary
  end

  test "start - returns title in map", context do
    assert context[:real_result].title == "danbickford.me"
  end

  test "links - returns list of links", context do
    assert context[:fake_result]
      |> Spydex.links 
      == [["<a href=\"test\">test</a>"], ["<a onclick='tester'>tester</a>"]]
  end

end
