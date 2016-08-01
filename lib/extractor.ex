defmodule Extractor do

  def find(html) do
    html 
      |> chars
      |> search
  end

  defp search([char | chars], string \\ "") do
    [h | cs] = chars
    [num | x] = cs
    if char == "<" and h == "h" and Enum.member?(["1", "2", "3", "4", "5", "6"], num) do
      string = string |> concat(char)
      string = string |> concat(h)
      process_tag_name(cs, string)
    else
      search(chars, string)
    end 
  end

  defp process_tag_name([num | chars], string \\ "") do
    string = string |> concat(num)
    process_header(chars, "h" |> concat(num), string)
  end

  defp process_header(chars, nil, string, headers) do
    headers
  end

  defp process_header([], _, _, headers) do
    headers
  end

  defp process_header([char | chars], tag, string \\ "", headers \\ []) do
    string = string |> concat(char)
    [slash | cs] = chars
    if char == "<" and slash == "/" do
      ans = cs |> process_tagname_close(tag, string |> concat(slash))
      headers = headers |> List.insert_at(-1, ans)
      IO.puts "HEADERS!"
      IO.puts headers
      process_header(cs, nil, ans, headers)
    else
      process_header(chars, tag, string, headers)
    end
  end

  defp process_tagname_close([char | chars], tag, string) do
    [num | tail] = chars
    if char |> concat(num) == tag do
      string |> concat(char |> concat(num)) |> concat(">")
    end
  end

  defp concat(str1, str2) do
    "#{str1}#{str2}"
  end

  defp chars(html) do
    html |> String.codepoints
  end

end
