class CreatePostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :post, foreign_key: true, index: true
      t.text :body
      t.timestamps
    end
  end
end
