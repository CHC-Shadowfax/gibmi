class EbayApi
  include HTTParty
  base_uri 'https://svcs.ebay.com/'

  def initialize(app_name)
    @options = { query: { 'OPERATION-NAME': 'findItemsByKeywords',
                          'SERVICE-VERSION': '1.0.0',
                          'SECURITY-APPNAME': app_name,
                          'GLOBAL-ID': 'EBAY-US',
                          'RESPONSE-DATA-FORMAT': 'JSON' } }
  end

  def get_product(keywords)
    puts "keywords: #{keywords}"
    @options[:query]['keywords'] = keywords
    response = self.class.get('/services/search/FindingService/v1', @options)
    json_response = JSON.parse(response.body)
    puts "json_response: #{json_response}"
    # Accessing the first product's galleryURL
    json_response['findItemsByKeywordsResponse'][0]['searchResult'][0]['item'][0]
  end
end
