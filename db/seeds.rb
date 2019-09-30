# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == "development"
  User.create!(
    name: 'admin',
    email: 'sample@sample.com',
    password: '12345678',
    admin: 1
  )
  Game.create!(
    home_team_name: '日本',
    away_team_name: 'ミャンマー',
    home_team_img: 'http://tospa-flags.com/881.gif',
    away_team_img: 'http://tospa-flags.com/724.gif',
    home_team_score: 2,
    away_team_score: 0,
    date: '2019-09-01'
  )
  GameMember.create!(
    game_id: 1,
    name: 'ホームの選手１',
    position: 'GK',
    home_away: 'home'
  )
  GameMember.create!(
    game_id: 1,
    name: 'ホームの選手２',
    position: 'DF',
    home_away: 'home'
  )
  GameMember.create!(
    game_id: 1,
    name: 'ホームの選手３',
    position: 'MF',
    home_away: 'home'
  )
  GameMember.create!(
    game_id: 1,
    name: 'outするホームの選手',
    position: 'FW',
    out_time: '46',
    home_away: 'home'
  )
  GameMember.create!(
    game_id: 1,
    name: 'inするホームの選手',
    position: 'FW',
    in_time: '46',
    home_away: 'home'
  )
  GameMember.create!(
    game_id: 1,
    name: 'アウェーの選手１',
    position: 'GK',
    home_away: 'away'
  )
  GameMember.create!(
    game_id: 1,
    name: 'アウェーの選手２',
    position: 'DF',
    home_away: 'away'
  )
  GameMember.create!(
    game_id: 1,
    name: 'アウェーの選手３',
    position: 'MF',
    home_away: 'away'
  )
  GameMember.create!(
    game_id: 1,
    name: 'outするアウェーの選手',
    position: 'FW',
    out_time: '46',
    home_away: 'away'
  )
  GameMember.create!(
    game_id: 1,
    name: 'inするアウェーの選手',
    position: 'FW',
    in_time: '46',
    home_away: 'away'
  )
end