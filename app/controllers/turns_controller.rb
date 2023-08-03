class TurnsController < ApplicationController

  before_action :find_turn, only: [:show, :update, :destroy]
  before_action :find_turns, only: [:index]

  def index
  end

  def show
  end

  def create
    @turn = Turn.create(turn_params)

    redirect_to turns_path
  end

  def update
    @turn.update(turn_params)

    redirect_to turn_path(@dog)
  end

  def destroy
  end

  private

  def find_turn
    @turn = Turn.find(params[:id])
  end

  def find_turns
    @turns = Turn.all
  end

  def turn_params
    params.require(:turn).permit(:number, :damage, :oponent_health_remaining, fight_id)
  end
end