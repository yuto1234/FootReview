require 'rails_helper'

feature 'review', type: :feature do
  background 'ユーザーがログインして試合詳細ページに移動' do
    user = FactoryBot.create(:user)
    game = FactoryBot.create(:game)

    # topページにいる状態
    visit root_path
    expect(page).to have_content('Sign up')

    # ログイン
    click_link "Sign in"
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[type="submit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('Signed in successfully')

    # 試合詳細ページに移動
    find('a[href="/games/1"]').click
    expect(current_path).to eq "/games/1"
    expect(page).to have_content('Starting Member')
  end

  scenario 'レビューを投稿する' do
    # レビューページまで移動
    click_link "Review a Post"
    expect(current_path).to eq "/games/1/reviews/new"
    expect(page).to have_content('Man of the match')
    # レビューを投稿
    expect{
    fill_in 'review[mom]', with: 'プレイヤー１'
    fill_in 'review[text]', with: '最高だった'
    find('input[type="submit"]').click
    expect(current_path).to eq "/games/1"
    expect(page).to have_content('Created review successfully.')
    }.to change(Review, :count).by(1)
  end
end