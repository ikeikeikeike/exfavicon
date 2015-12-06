defmodule Exfavicon do

  @doc """
  Finder and detector.
  """
  defdelegate find(url), to: Exfavicon.Finder, as: :find
  defdelegate find(html, url), to: Exfavicon.Finder, as: :find
  defdelegate valid_favicon_url?, to: Exfavicon.Finder, as: :valid_favicon_url?

end
