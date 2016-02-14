class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.references :conversation, index: true, foreign_key: true
      t.integer :sender_id, index:true
      t.timestamps null: false
    end
  end
end
