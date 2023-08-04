class ArenaController < ApplicationController
    def index
        @champions = Champion.all
        @weapons = Weapon.all

        @champion_1_init_id = @champions.random(0).id
        @champion_2_init_id = @champions.random(@champion_1_init_id).id
    end

    def show
    end

    def fight
        sc = rand(1..2) # 1 or 2 to select which champion starts
        first = "champion_#{sc}"
        second = "champion_#{sc == 1 ? 2 : 1}"

        champions = init_fighters(first, second)
        fight = Fight.create(date: Date.today, champion_1_id: champions[0].id, champion_2_id: champions[1].id)
        weapons = init_weapons(first, second)
        upgrade_champions(champions, weapons)

        winner = compute_match(champions[0], champions[1], fight)
        fight.update(winner_id: winner.id)

        render json: {
            first: sc,
            weapons: weapons,
            champions: champions,
            turns: Fight.last.turns,
            winner: Champion.find(Fight.last.winner_id)
        }
    end

    def init_fighters(first, second)
        [Champion.find(params["#{first}_id"]), Champion.find(params["#{second}_id"])]
    end

    def init_weapons(first, second)
        champion_1_boost = 0
        champion_2_boost = 0

        if params["#{first}_weapon_1_id"]
            champion_1_weapon_1 = Weapon.find(params["#{first}_weapon_1_id"]) if params["#{first}_weapon_1_id"]
            champion_1_boost += champion_1_weapon_1.stats_bonus
        end

        if params["#{first}_weapon_2_id"]
            champion_1_weapon_2 = Weapon.find(params["#{first}_weapon_2_id"]) if params["#{first}_weapon_2_id"]
            champion_1_boost += champion_1_weapon_2.stats_bonus
        end

        if params["#{second}_weapon_1_id"]
            champion_2_weapon_1 = Weapon.find(params["#{second}_weapon_1_id"]) if params["#{second}_weapon_1_id"]
            champion_2_boost += champion_2_weapon_1.stats_bonus
        end

        if params["#{second}_weapon_2_id"]
            champion_2_weapon_2 = Weapon.find(params["#{second}_weapon_2_id"]) if params["#{second}_weapon_2_id"]
            champion_2_boost += champion_2_weapon_2.stats_bonus
        end

        [champion_1_boost, champion_2_boost]
    end

    def upgrade_champions(champions, weapons)
        champions.each_with_index do |c, i|
            c.attack_point = c.attack_point += weapons[i]
        end

        champions
    end

    def compute_match(champion_1, champion_2, fight)
        turn = 1
        
        champion_1_hp = champion_1.health_point
        champion_2_hp = champion_2.health_point

        while(champion_1_hp > 0 || champion_2_hp > 0) do
            champion_2_hp -= champion_1.attack_point
            Turn.create(
                number: turn, damage: champion_1.attack_point, oponent_health_remaining: champion_2_hp, fight_id: fight.id,
                champion_id: champion_1.id
            )
            break if champion_2_hp < 0
            turn += 1
            champion_1_hp -= champion_2.attack_point
            Turn.create(
                number: turn, damage: champion_2.attack_point, oponent_health_remaining: champion_1_hp, fight_id: fight.id,
                champion_id: champion_2.id
            )
            turn += 1
        end

        return champion_2_hp < 0 ? champion_1 : champion_2
    end
end
