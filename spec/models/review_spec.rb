require 'rails_helper'

describe Review do
  describe '#create' do
    it "text,momがあればreviewを保存できる" do
      review = build(:review)
      expect(review).to be_valid
    end

    it "textが空の場合登録できない" do
      review = build(:review, text: "")
      review.valid?
      expect(review.errors[:text]).to include("can't be blank")
    end

    it "momが空の場合登録できない" do
      review = build(:review, mom: "")
      review.valid?
      expect(review.errors[:mom]).to include("can't be blank")
    end
  end
end