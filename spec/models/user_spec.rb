require 'rails_helper'

describe User do
  describe '#create' do
    it "name,password,password_confirmationがあればUserを保存できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameカラムが空の場合登録できない" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "nameが重複していた場合登録できない" do
      user = create(:user)
      another_user = build(:user, name: user.name)
      another_user.valid?
      expect(another_user.errors[:name]).to include("has already been taken")
    end

    it "passwordが空の場合登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "password_confirmationが空の場合登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "パスワードが５文字以下だと登録できないこと" do
      user = build(:user, password: "55555", password_confirmation: "55555")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end 