FactoryBot.define do

  factory :article, class: Article do
    title "My article title"
    subline "My article subline"
    teaser "My article teaser"
    body "My article text"
    article_image { Rack::Test::UploadedFile.new(Rails.root.join('app','assets', 'images', 'articles', 'article1.jpg'), 'image/jpeg') }
  end

  factory :article_with_invalid_image, class: Article do
    title "My article title"
    subline "My article subline"
    teaser "My article teaser"
    body "My article text"
    article_image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'test_images', 'invalid_image_file.raw'), 'image/raw') }
  end

 # article_image.size = 0.8.megabytes
end