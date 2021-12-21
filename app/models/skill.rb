# == Schema Information
#
# Table name: skills
#
#  id            :bigint           not null, primary key
#  name          :string
#  skill_type_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Skill < ApplicationRecord
  belongs_to :skill_type
end
