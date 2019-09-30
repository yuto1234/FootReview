FactoryBot.define do
  factory :review do
    id   { 1 }
    text {"test"}
    mom  {"test"}
    user
    game
  end
end