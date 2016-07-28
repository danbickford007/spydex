defmodule Spydex do

  def start(url) do
    data = url |> content
    %{
      url: url,
      title: data.body |> title,
      body: data.body  
    }
  end

  def content(url) do
    HTTPoison.start
    HTTPoison.get! url 
  end

  def title(result) do
    String.split(result, ~r"<title>")
      |> List.last
      |> String.split(~r"</title>")
      |> List.first
  end

end
