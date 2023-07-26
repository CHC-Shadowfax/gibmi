module ApplicationHelper

  def ensure_https(url)
    url.start_with?('http://', 'https://') ? url : "https://#{url}"
  end
end
