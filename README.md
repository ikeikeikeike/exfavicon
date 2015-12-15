# Exfavicon

[![Build Status](http://img.shields.io/travis/ikeikeikeike/exfavicon.svg?style=flat-square)](http://travis-ci.org/ikeikeikeike/exfavicon)
[![Hex version](https://img.shields.io/hexpm/v/exfavicon.svg "Hex version")](https://hex.pm/packages/exfavicon)
[![Hex downloads](https://img.shields.io/hexpm/dt/exfavicon.svg "Hex downloads")](https://hex.pm/packages/exfavicon)

A exfavicon to detect a site's favicon.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

1. Add exfavicon to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:exfavicon, "~> 0.3"}]
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

# Find https://www.google.com
Exfavicon.find("http://google.com/")        # "https://www.google.co.jp/images/branding/product/ico/googleg_lodp.ico"

```

[API Reference](http://hexdocs.pm/exfavicon/0.3.1/api-reference.html).
