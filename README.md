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

## Usage

```elixir
# Find http://elixir-lang.org
Exfavicon.find("http://elixir-lang.org")    #  "http://elixir-lang.org/favicon.ico"

# Find http://twitter.com
Exfavicon.find("http://twitter.com")        # "http://abs.twimg.com/favicons/favicon.ico"

# Find http://facebook.com
Exfavicon.find("http://facebook.com")       # "https://static.xx.fbcdn.net/rsrc.php/yV/r/hzMapiNYYpW.ico"

# Find http://youtube.com
Exfavicon.find("http://youtube.com")        # "https://s.ytimg.com/yts/img/favicon-vflz7uhzw.ico"
```
