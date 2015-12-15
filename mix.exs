defmodule Exfavicon.Mixfile do
  use Mix.Project

  @description """
  A exfavicon to detect a site's favicon.
  """

  def project do
    [ app: :exfavicon,
      name: "Exfavicon",
      version: "0.3.1",
      elixir: "~> 1.1",
      description: @description,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      package: package,
      deps: deps,
      source_url: "https://github.com/ikeikeikeike/exfavicon" 
    ]
  end


  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [ {:httpoison, "~> 0.8"}, 
      {:floki, "~> 0.7"},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
    ]
  end

  defp package do
    [ maintainers: ["Tatsuo Ikeda / ikeikeikeike"],
      licenses: ["MIT"],
      links: %{"github" => "https://github.com/ikeikeikeike/exfavicon"} ]
  end
end
