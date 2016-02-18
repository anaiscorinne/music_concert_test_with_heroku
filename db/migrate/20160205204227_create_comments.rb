class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :concert, index: true, foreign_key: true
      t.string :name
      t.string :email
      t.text :body

      t.timestamps null: false
    end
  end
end
