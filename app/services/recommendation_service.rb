class RecommendationService

  # def initialize(client)
  #   @client = client
  # end

  # def call(categories)
  #   prompt = "Give me 9 gift recommendations just give me the list comma separated from #{categories}"

  #   response = @client.chat(
  #     parameters: {
  #       model: "gpt-3.5-turbo",
  #       messages: [ role: "user", content: prompt],
  #       temperature: 0.7
  #     }
  #   )

  #   recommendations = response.dig("choices", 0, "message", "content") # audifonos, sillon, camara
  #    raise

  #   recommendations.each do |rec|
  #     # Implement API logic to get description and image from amazon site:
  #     # gift = Gift.create(name: "the one that the api gave you", description: "the one that the api gave you")
  #     # gift.attach....

  #     UserGiftRecommendation.create!(user: current_user, gift: gift)
  #     # user_gift_recommendations = # for each gift generated, create a user gift recommendation
  #   end
  # end
end
