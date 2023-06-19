class Post < ApplicationRecord
  belongs_to :gato
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :users, through: :reactions

  Kinds = %w[like].freeze
  KindsSpanish = {"like" => "Me gusta"}.freeze
end
