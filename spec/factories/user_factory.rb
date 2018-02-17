FactoryBot.define do 
  factory :user, class: User do 
    email "john_doe@example.com"
    password "foobar"
    first_name "John"
    last_name "Doe"
    admin false
  end
  
  factory :other_user, class: User do 
    email "jane_doe@example.com"
    password "foobar"
    first_name "Jane"
    last_name "Doe"
    admin false
  end

  factory :new_user, class: User do 
    email "new_user@example.com"
    password "foobar"
    first_name "New"
    last_name "User"
    admin false
  end

  factory :admin, class: User do 
    email "admin@example.com"
    password "foobar"
    first_name "Admin"
    last_name "User"
    admin true
  end
end