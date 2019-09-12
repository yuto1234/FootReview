class GamesController < ApplicationController
  def index
    @games = Game.order(date: :desc).page(params[:page]).per(5)
  end

  def show
    @game = Game.find(params[:id])
    @game_members = GameMember.where(game_id: @game)
  end
end
