class GamesController < ApplicationController
  def index
    @games = Game.order(date: :desc).page(params[:page]).per(5)
  end
end
