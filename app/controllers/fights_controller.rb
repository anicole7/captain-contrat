class FightsController < ApplicationController
  before_action :find_fight, only: [:show, :update, :destroy]
  before_action :find_fights, only: [:index]

  def index
  end

  def show
    @winner = Champion.find(@fight.winner_id)
    @looser = Champion.find(
        @fight.winner_id == @fight.champion_1_id ? @fight.champion_2_id : @fight.champion_1_id
    )
    @turns_count = @fight.turns.count
  end

  def create
    @fight = Fight.create(fight_params)

    redirect_to fights_path
  end

  def update
    @fight.update(fight_params)

    redirect_to fight_path(@dog)
  end

  def destroy
  end

  private

  def find_fight
    @fight = Fight.find(params[:id])
  end

  def find_fights
    @fights = Fight.all
  end

  def fight_params
    params.require(:fight).permit(:date, :champion_1_id, :champion_2_id)
  end
end