class Weapon < ApplicationRecord
    scope :light, -> { where("weight = 1") }
end
