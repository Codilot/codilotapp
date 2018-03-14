FactoryBot.define do
  factory :categorie, class: Categorie do
    name "Living"
  end
  factory :living, class: Categorie do
    name "Living"
  end
  factory :lighting, class: Categorie do
    name "Lighting"
  end
  factory :dining, class: Categorie do
    name "Dining"
  end
end