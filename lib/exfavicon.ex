defmodule Exfavicon do

  @doc """
  Finder and detector.
  """
  defdelegate find(url), to: Exfavicon.Finder, as: :find
  defdelegate find_from_html(url, html), to: Exfavicon.Finder, as: :find_from_html
end
