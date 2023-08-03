class ChampionsController < ApplicationController
  before_action :find_champion, only: [:show, :update, :destroy]
  before_action :find_champions, only: [:index]
  
  def index
  end
  
  def show
  end
  
  def create
    @champion = Champion.create(champion_params)
  
    redirect_to champions_path
  end
  
  def update
    @champion.update(champion_params)
  
    redirect_to champion_path(@dog)
  end
  
  def destroy
  end
  
  private
  
  def find_champion
    @champion = Champion.find(params[:id])
  end
  
  def find_champions
    @champions = Champion.all
  end
  
  def champion_params
    params.require(:champion).permit(:name, :health_point, :attack_point, left_weapon_id, right_weapon_id)
  end
end