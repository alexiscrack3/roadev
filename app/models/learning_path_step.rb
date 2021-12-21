# == Schema Information
#
# Table name: learning_path_steps
#
#  id               :bigint           not null, primary key
#  title            :string
#  learning_path_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class LearningPathStep < ApplicationRecord
  belongs_to :learning_path
end
