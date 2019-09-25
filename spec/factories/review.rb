FactoryBot.define do
  factory :review do
    id   { 1 }
    text {"test"}
    mom  {"test"}
    rate { 3 }
    user
    game
  end
end