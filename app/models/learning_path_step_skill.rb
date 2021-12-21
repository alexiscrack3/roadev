# == Schema Information
#
# Table name: learning_path_step_skills
#
#  id                    :bigint           not null, primary key
#  learning_path_step_id :bigint           not null
#  skill_id              :bigint           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class LearningPathStepSkill < ApplicationRecord
  belongs_to :learning_path_step
  belongs_to :skill
end
