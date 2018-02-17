FactoryBot.define do
  factory :article, class: Article do
    title: "My article title"
    text: "My article text"
    image_url: "assets/img.jpg"
  end
end