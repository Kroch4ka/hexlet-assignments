class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :status, default: 'NEW'
      t.string :creator
      t.string :performer
      t.boolean :completed

      t.timestamps
    end
  end
end
