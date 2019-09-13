class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: :new # 未ログインユーザーをログイン画面に遷移

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to_game_show
    else
      render action: :new
    end
  end
  
  def edit
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:rate, :mom, :text).merge(game_id: params[:game_id], user_id: current_user.id)
  end

  def redirect_to_game_show
    redirect_to "/games/#{params[:game_id]}"
  end
end
