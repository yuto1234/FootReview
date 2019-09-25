FactoryBot.define do
  factory :user do
    id                    { 1 }
    name                  {"test"}
    email                 {"test@gmail.com"}
    password              {"666666"}
    password_confirmation {"666666"}
  end
end 