class Fight < ApplicationRecord
    has_many :turns, :dependent => :delete_all
end
