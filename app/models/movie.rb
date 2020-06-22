class Movie < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, :dependent => :delete_all
end
