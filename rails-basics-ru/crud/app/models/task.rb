# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  status      :string           default("NEW")
#  creator     :string
#  performer   :string
#  completed   :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Task < ApplicationRecord
  validates :name, :status, :creator, :completed, presence: true
end
