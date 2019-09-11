class GamesController < ApplicationController
  def index
    @games = Game.order(date: :desc)
  end
end
