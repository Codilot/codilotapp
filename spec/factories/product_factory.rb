FactoryBot.define do 

  factory :product, class: Product do 
    name "Lamp"
    teaser "great new lamp"
    description "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores e"
    price 200.50
    image_url "assets/img.jpg"
    product_image "image"
    categorie
  end

  factory :search_product_one, class: Product do 
    name "Basic lamp"
    teaser "great basic lamp"
    description "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores e"
    price 199.99
    categorie
  end

  factory :search_product_two, class: Product do 
    name "Basic lamp hood"
    teaser "Hood of the great basic lamp"
    description "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores e"
    price 9.99
    categorie
  end
  

end

