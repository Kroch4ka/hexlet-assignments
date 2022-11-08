class PostComment < ApplicationRecord
  self.table_name = 'comments'
  belongs_to :post
  validates :body, presence: true
end
