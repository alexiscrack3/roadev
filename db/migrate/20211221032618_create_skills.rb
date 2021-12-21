class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.references :skill_type, null: false, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
