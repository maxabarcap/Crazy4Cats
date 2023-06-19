class Gato < ApplicationRecord
    has_many :posts, dependent: :destroy
end
