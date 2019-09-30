class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :review_set, only: [:show, :destroy, :edit, :update]
  before_action :game_set, only: [:show, :edit]
  before_action :game_members_set, only: [:show, :new, :create, :edit]

  def show
    @player_reviews = PlayerReview.where(review_id: params[:id])
  end

  def new
    @review = Review.new
    @review.player_reviews.build
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
      @review.update(review_update_params)
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
    params.require(:review).permit(:rate, :mom, :text, player_reviews_attributes: [:text, :rate]).merge(game_id: params[:game_id], user_id: current_user.id)
  end

  def review_update_params
    params.require(:review).permit(:rate, :mom, :text, player_reviews_attributes: [:text, :rate, :id, :_destroy]).merge(game_id: params[:game_id], user_id: current_user.id)
  end

  def review_set
    @review = Review.find(params[:id])
  end

  def game_set
    @game = Game.find(params[:game_id])
  end

  def game_members_set
    @game_members = GameMember.where(game_id: params[:game_id], home_away: 'home')
  end
end
