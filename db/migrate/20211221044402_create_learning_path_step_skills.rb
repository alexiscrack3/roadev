class CreateLearningPathStepSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :learning_path_step_skills do |t|
      t.references :learning_path_step, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
