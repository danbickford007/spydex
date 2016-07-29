defmodule LinksTest do
  use ExUnit.Case
  alias Link
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

  test "links - returns list of links", context do
    assert context[:fake_result]
      |> Link.links 
      == [["<a href=\"test\">test</a>"], ["<a onclick='tester'>tester</a>"]]
  end

end
