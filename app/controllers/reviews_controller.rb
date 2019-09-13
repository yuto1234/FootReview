class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: :new # 未ログインユーザーをログイン画面に遷移

  def show
  end

  def new
    @review = Review.new
  end

  def create
  end
  
  def edit
  end

  def update
  end

  def destroy
  end
end
