# Exfavicon

A exfavicon to detect a site's favicon.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

1. Add exfavicon to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:exfavicon, "~> 0.2"}]
    end
    ```

2. Ensure exfavicon is started before your application:

    ```elixir
    def application do
      [applications: [:exfavicon]]
    end
    ```
