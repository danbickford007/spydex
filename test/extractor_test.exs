defmodule ExtractorTest do
  use ExUnit.Case
  alias Spydex
  alias HtmlFactory

  setup_all do
    fake_result = HtmlFactory.simple 
    {:ok, result: fake_result}
  end

  test "find - returns extracted element", context do
    assert context[:result]
      |> Extractor.find
      == ["<h1 style='color:black'>hello world</h1>"] 
  end

end
