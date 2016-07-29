defmodule Link do

  def links(result, links \\ [])
  def links(result, links) do
    result
      |> String.codepoints
      |> build_link
  end

  def build_link([_ | tail], links, _) when length(tail) < 1 do
    links
  end

  def build_link([char | tail], links \\ [], anchor \\ "") do
    anchor = "#{anchor}#{char}"
    {links, anchor} = links
        |> add_link(anchor |> extract_link, anchor)
    build_link(tail, links, anchor) 
  end

  def extract_link(anchor) do
    Regex.scan(~r"<a.*(?!<a)<\/a>", anchor)
  end

  def add_link(links, link, anchor) when link != [] do
    links = links |> List.insert_at(-1, link |> List.first)
    {links, ""}
  end

  def add_link(links, link, anchor) do
    {links, anchor}
  end

end
