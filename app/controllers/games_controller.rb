class GamesController < ApplicationController
  def index
    @games = Game.order(date: :desc).page(params[:page]).per(5)
  end

  def show
    @game = Game.find(params[:id])
    @game_members = GameMember.where(game_id: @game)
    @reviews = Review.where(game_id: @game).includes(:user).order(created_at: :desc).page(params[:page]).per(5)
  end
end
