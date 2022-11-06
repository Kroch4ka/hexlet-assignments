class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :status, foreign_key: true
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
