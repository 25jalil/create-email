class AddAttacmentToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :attachment, :string
  end
end
