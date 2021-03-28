class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.boolean :editor
      t.boolean :writer
      t.boolean :reviewer

      t.timestamps
    end
  end
end
