FactoryBot.define do
  factory :user do
    id                    { 1 }
    name                  {"test"}
    password              {"666666"}
    password_confirmation {"666666"}
  end
end 