module ApplicationHelper

  def ensure_https(url)
    url.start_with?('http://', 'https://') ? url : "https://#{url}"
  end

  def formatted_date(date)
    date.strftime("%B %d of %Y")
  end
end
