class WeaponsController < ApplicationController
  before_action :find_weapon, only: [:show, :update, :destroy]
  before_action :find_weapons, only: [:index]
  
  def index
  end
  
  def show
  end

  def new
    @weapon = Weapon.new
  end
  
  def create
    weapon = Weapon.new(weapon_params)

    if weapon.save
      redirect_to weapons_path
    else
      redirect_to root
    end
  end
  
  def update
    @weapon.update(weapon_params)
  
    redirect_to weapon_path(@dog)
  end
  
  def destroy
  end
  
  private
  
  def find_weapon
    @weapon = Weapon.find(params[:id])
  end
  
  def find_weapons
    @weapons = Weapon.all
  end
  
  def weapon_params
    params.require(:weapon).permit(:name, :defensive, :weight, :stats_bonus)
  end
end