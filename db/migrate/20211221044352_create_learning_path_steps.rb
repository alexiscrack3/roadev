class CreateLearningPathSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :learning_path_steps do |t|
      t.string :title
      t.string :description
      t.references :learning_path, null: false, foreign_key: true

      t.timestamps
    end
  end
end
