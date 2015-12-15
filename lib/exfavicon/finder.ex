defmodule Exfavicon.Finder do
  use HTTPoison.Base

  def find(url) do
    {:ok, location, resp} = req(url)
    find_from_html(resp.body, location)
  end

  def find_from_html(html, url) do
    case detect(html, url) do
      {:ok, icon_url} ->
        if valid_favicon_url?(icon_url), do: icon_url, else: nil
      _ ->
        nil
    end
  end

  defp req(url) do
    {:ok, resp} = get(url)

    headers = 
      resp.headers
      |> Enum.map(fn({k, v}) -> {k |> String.downcase, v} end)

    case List.keyfind(headers, "location", 0) do
      {"location", location} ->
        req(location)
      _ ->
        {:ok, url, resp}
    end
  end

  defp detect(html, url) do
    {:ok, ptn} = Regex.compile("^(shortcut )?icon$", "i") 

    favicon_url_or_path = 
      html 
      |> Floki.find("link") 
      |> Enum.filter(&(Regex.match?(ptn, List.first(Floki.attribute(&1, "rel")))))
      |> Enum.flat_map(&(Floki.attribute(&1, "href")))
      |> List.first

    case favicon_url_or_path do
      "" ->
        {:error, "blank"}
      nil ->
        {:error, "blank"}
      _ ->
        case Regex.match?(~r/^https?/, favicon_url_or_path) do
          true ->
            {:ok, favicon_url_or_path}
          false ->
            uri = URI.parse(favicon_url_or_path)
            case uri do
              %URI{host: nil} -> 
                {:ok, %{URI.parse(url) | path: uri.path} |> URI.to_string}
              %URI{scheme: nil} -> 
                {:ok, %{uri | scheme: "http"} |> URI.to_string}
              _ ->
                {:error, "unknown uri"}
            end
        end
    end
  end

  defp valid_favicon_url?(url) do
    case get(url) do
      {:ok, resp} ->
        ctype = 
          resp.headers
          |> get_header("content-type")
        if Regex.match?(~r/image/, ctype), do: true, else: false
      _ ->
        false
    end
  end

  defp get_header(headers, key) do
    ctype = 
      headers 
      |> Enum.map(fn({k, v}) -> {k |> String.downcase, v} end)
      |> Enum.filter(fn({k, _}) -> k == (key |> String.downcase) end)
    case ctype do
      [] ->
        ""
      _ ->
        ctype |> hd |> elem(1)
    end
  end

end
