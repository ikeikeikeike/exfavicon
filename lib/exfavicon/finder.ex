defmodule Exfavicon.Finder do
  use HTTPoison.Base

  def find(url) do
    response = url |> request
    find_from_html(response.body, response.request_url)
  end

  def find_from_html(html, url) do
    favicon_url = find_from_link(html, url) || default_path(url)

    if valid_favicon_url?(favicon_url) do
      favicon_url
    else
      nil
    end
  end

  defp find_from_link(html, url) do

    Floki.parse(html).find('//link')

    Floki.parse(html).find('//link').each do |link|
      if link[:rel] =~ /^(shortcut )?icon$/i
        favicon_url_or_path = link[:href]

        if favicon_url_or_path =~ /^http/
          return favicon_url_or_path
        else
          return URI.join(url, favicon_url_or_path).to_s
        end
      end
    end

    nil
  end

  defp default_path(url) do
    uri = URI(url)
    uri.path = '/favicon.ico'
    %w[query fragment].each do |element|
      uri.send element + '=', nil
    end

    uri.to_s
  end

  defp request(url, options \\ []) do
    method = options[:method] || :get
    max_redirect = options[:max_redirect] || 10

    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)

    if uri.scheme == 'https'
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    response = http.start do |http|
      path =
        (uri.path.empty? ? '/' : uri.path) +
        (uri.query       ? '?' + uri.query : '') +
        (uri.fragment    ? '#' + uri.fragment : '')
      http.send(method, path)
    end

    if response.kind_of?(Net::HTTPRedirection) && max_redirect > 0
      request(response['Location'], :max_redirect => max_redirect - 1)
    else
      response.instance_variable_set('@request_url', url)
      def response.request_url; @request_url; end
      response
    end
  end

end
