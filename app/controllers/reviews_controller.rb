class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: :new # 未ログインユーザーをログイン画面に遷移
  before_action :review_set, only: [:show, :destroy, :edit, :update]
  before_action :game_set, only: [:show, :edit]

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to game_path(@review.game_id), notice: 'Created review successfully.'
    else
      render action: :new
    end
  end
  
  def edit
  end

  def update
    if @review.user_id == current_user.id
      @review.update(review_params)
      redirect_to game_path(@review.game_id), notice: 'Edited review successfully.'
    else
      render action: :edit
    end
  end

  def destroy
    @review.destroy if @review.user_id == current_user.id
    redirect_to game_path(@review.game_id), notice: 'Deleted review successfully.'
  end

  private
  def review_params
    params.require(:review).permit(:rate, :mom, :text).merge(game_id: params[:game_id], user_id: current_user.id)
  end

  def review_set
    @review = Review.find(params[:id])
  end

  def game_set
    @game = Game.find(params[:game_id])
  end
end
