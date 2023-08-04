# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Weapon.create(name: "Excalibur", defensive: false, weight: 1, stats_bonus: 10)
Weapon.create(name: "Shield", defensive: true, weight: 1, stats_bonus: 3)
Weapon.create(name: "Faux 2M", defensive: false, weight: 2, stats_bonus: 15)
Champion.create(name: "Brand", health_point: 70, attack_point: 9)
Champion.create(name: "Heimerdinger", health_point: 60, attack_point: 11)
Champion.create(name: "Karthus", health_point: 80, attack_point: 8)
Champion.create(name: "Arthas", health_point: 120, attack_point: 5)
Champion.create(name: "Garrosh", health_point: 90, attack_point: 12)
Champion.create(name: "Anakin", health_point: 100, attack_point: 10)
Champion.create(name: "Yoda", health_point: 100, attack_point: 15)
Champion.create(name: "Pikachu", health_point: 85, attack_point: 11)

