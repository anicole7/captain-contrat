class Champion < ApplicationRecord
  scope :random, ->(id) { where("id != ?", id).sample }
end
