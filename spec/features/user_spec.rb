require 'rails_helper'

feature 'user', type: :feature do
  scenario 'ユーザーの新規登録・ログアウト・ログインをテスト' do
    # topページにいる状態
    visit root_path
    expect(page).to have_content('Sign up')

    # 新規登録
    expect{
    visit new_user_registration_path
    fill_in 'user_name', with: 'テストユーザー'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    find('input[type="submit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('Welcome! You have signed up successfully.')
    }.to change(User, :count).by(1)

    # ログアウト
    find('a[data-method="delete"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('Signed out successfully.')

    # ログイン
    visit new_user_session_path
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '123456'
    find('input[type="submit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('Signed in successfully')
  end
end