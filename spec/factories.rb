FactoryGirl.define do

  sequence(:random_string) {|n| "Product#{n}" }

  sequence(:email) {|n| "foo#{n}@example.com"}

  factory :user do
    name "Foobar"
    email { generate(:email) }
    password "secret"
    password_confirmation "secret"
  end

  factory :product_item do
    sequence(:size) { |n| ['small', 'medium', 'large'][(n % 3)] }
    quantity 4
  end

  factory :trend do
    sequence(:name) { |n| "Trend#{n}" }
  end

  factory :category do
    sequence(:name) {|n| "Category#{n}"}
  end

  factory :image do
   path { File.open(File.join(Rails.root, 'spec', 'fixtures', 'files', 'example.jpg')) }
  end

  factory :product, class: Product do
    name { generate :random_string }
    description { generate :random_string }
    images { [FactoryGirl.create(:image)] }
    category { FactoryGirl.create(:category) }
    price 2000
    product_items { [FactoryGirl.create(:product_item, :size => 'small', :quantity => 4),
                      FactoryGirl.create(:product_item, :size => 'medium', :quantity => 4),
                      FactoryGirl.create(:product_item, :size => 'large', :quantity => 4)] }

  end
end
