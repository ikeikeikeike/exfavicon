defmodule ExfaviconTest do
  use ExUnit.Case
  doctest Exfavicon

  test "Check http://elixir-lang.org" do
    assert Exfavicon.find("http://elixir-lang.org") == "http://elixir-lang.org/favicon.ico"
  end

  test "Check http://twitter.com" do
    assert Exfavicon.find("http://twitter.com") == "http://abs.twimg.com/favicons/favicon.ico"
  end

  test "Check http://facebook.com" do
    assert Exfavicon.find("http://facebook.com") == "https://static.xx.fbcdn.net/rsrc.php/yV/r/hzMapiNYYpW.ico"
  end

  test "Check http://youtube.com" do
    assert Exfavicon.find("http://youtube.com") == "https://s.ytimg.com/yts/img/favicon-vflz7uhzw.ico"
  end

  # test "Check http://google.com" do
    # assert String.starts_with?(Exfavicon.find("http://google.com"), "http://www.google.co.jp/images/branding/product/ico/googleg_lodp.ico")
  # end

end
