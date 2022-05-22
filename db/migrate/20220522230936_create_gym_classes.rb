class CreateGymClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :gym_classes do |t|
      t.string :name
      t.string :description
      t.string :teacher_name
      t.datetime :start_time
      t.integer :duration
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
