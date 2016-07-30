defmodule LinksTest do
  use ExUnit.Case
  alias Link
  alias Spydex
  alias HtmlFactory

  setup_all do
    fake_result = HtmlFactory.simple 
    {:ok, fake_result: fake_result}
  end

  test "links - returns list of links", context do
    assert context[:fake_result]
      |> Link.links 
      == [["<a href=\"test\">test</a>"], ["<a onclick='tester'>tester</a>"]]
  end

  test "click - follows href of anchor" do

  end

end
