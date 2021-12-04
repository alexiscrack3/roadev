# == Schema Information
#
# Table name: learning_paths
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class LearningPath < ApplicationRecord
  validates :title, presence: true
end
