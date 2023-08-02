require 'uri'

class RecommendationService
  def initialize(user)
    @user = user
    @client = OpenAI::Client.new(
      access_token: ENV['OPENAI_ACCESS_TOKEN'],
      uri_base: 'https://api.openai.com/',
      request_timeout: 240
  )
  end

  def call(categories)
    prompt = "Give me 9 gift recommendations just give me the list comma separated from #{categories}, omitting the category names, keep it in two words, the gift suggestions must be a purchaseable gift, dont use numbering to list the results, comma separate the items."

    response = client_message(prompt)

    recommendations = response.dig("choices", 0, "message", "content") # audifonos, sillon, camara
    recommendations.split(",").each do |rec|
      ebay_product = EbayApi.new(ENV['EBAY_API_KEY']).get_product(rec)

      name = ebay_product["title"][0]
      url = ebay_product["viewItemURL"][0]
      image = ebay_product["galleryURL"][0]
      description = generate_description(name)
      purchase_places = purchase_places(rec)

      create_user_gift_recommendations(name, url, image, description, purchase_places)
    end
  end

   def generate_description(name)
      prompt = "Give me a short description to #{name}, suppose that you're selling it on ebay"
      response = client_message(prompt)

      response.dig("choices", 0, "message", "content")
   end

  def purchase_places(name)
    prompt = "I need direct straight answer with no additional explanation, give me 3 online stores that can I use to go buy #{name}, just give me straight the URL of the stores, dont use numbering to list the results, comma separate the results"
    response = client_message(prompt)

    # puts "response: #{response}"
    response.dig("choices", 0, "message", "content")
  end

  def client_message(prompt)
    @client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [ role: "user", content: prompt],
        temperature: 0.7
      }
    )
  end

  def create_user_gift_recommendations(name, url, image, description, purchase_places)
    UserGiftRecomendation.create!(
      name: name,
      url: url,
      image: image,
      description: description,
      purchase_places: purchase_places,
      user: @user
    )
  end
end
