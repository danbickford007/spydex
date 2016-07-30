defmodule Spydex do

  alias Link

  def parse(url) do
    data = url |> content |> package
  end

  def package({url, data}) do
    %{
      url: url,
      title: data.body |> title,
      links: data.body |> Link.links,
      h1: data.body |> h1,
      body: data.body
    }
  end

  defp content(url) do
    HTTPoison.start
    {url, HTTPoison.get!(url)}
  end

  defp h1(html) do
    html
  end

  defp title(result) do
    String.split(result, ~r"<title>")
      |> List.last
      |> String.split(~r"</title>")
      |> List.first
  end



end
