class CreateQuestion2s < ActiveRecord::Migration[5.2]
  def change
    create_table :question2s do |t|
      t.string :title
      t.text :body
      t.boolean :resolved

      t.timestamps
    end
  end
end
