class Author < ApplicationRecord
  # has_and_belongs_to_many :articles

  has_many :articles
end
