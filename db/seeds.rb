# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

e = Weapon.create(name: "Excalibur", defensive: false, weight: 1, stats_bonus: 10)
s = Weapon.create(name: "Shield", defensive: true, weight: 1, stats_bonus: 3)
f = Weapon.create(name: "Faux 2M", defensive: false, weight: 2, stats_bonus: 15)

b = Champion.create(name: "Brand", health_point: 100, attack_point: 10, left_weapon_id: e.id, right_weapon_id: e.id)
h = Champion.create(name: "Heimerdinger", health_point: 100, attack_point: 10, left_weapon_id: e.id, right_weapon_id: e.id)
k = Champion.create(name: "Karthus", health_point: 100, attack_point: 10, left_weapon_id: e.id, right_weapon_id: e.id)
a = Champion.create(name: "Arthas", health_point: 100, attack_point: 10, left_weapon_id: e.id, right_weapon_id: e.id)

Champion.create(name: "Garrosh", health_point: 100, attack_point: 10, left_weapon_id: f.id, right_weapon_id: nil)
Champion.create(name: "Anakin", health_point:100, attack_point: 10, left_weapon_id: f.id, right_weapon_id: nil)
Champion.create(name: "Yoda", health_point:100, attack_point: 10, left_weapon_id: f.id, right_weapon_id: nil)

f1 = Fight.create(date: Date.today, champion_1_id: b.id, champion_2_id: a.id)
Fight.create(date: Date.today, champion_1_id: k.id, champion_2_id: h.id)
Fight.create(date: Date.today, champion_1_id: b.id, champion_2_id: a.id)
Fight.create(date: Date.today, champion_1_id: h.id, champion_2_id: a.id)
Fight.create(date: Date.today, champion_1_id: h.id, champion_2_id: b.id)

Turn.create(number: 1, damage: 10, oponent_health_remaining: 90, fight_id: f1.id)
Turn.create(number: 2, damage: 10, oponent_health_remaining: 80, fight_id: f1.id)
Turn.create(number: 3, damage: 10, oponent_health_remaining: 70, fight_id: f1.id)
Turn.create(number: 4, damage: 10, oponent_health_remaining: 60, fight_id: f1.id)
