FactoryBot.define do
  factory :game do
    id              { 1 }
    home_team_name  {'日本'}
    away_team_name  {'ブラジル'}
    home_team_img   {'http://tospa-flags.com/881.gif'}
    away_team_img   {'http://tospa-flags.com/646.gif'}
    home_team_score { 1 }
    away_team_score { 4 }
    date            {'2006-06-23'}
  end
end