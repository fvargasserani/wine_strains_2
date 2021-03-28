class AddMagazineRefToRole < ActiveRecord::Migration[6.0]
  def change
    add_reference :roles, :magazine, null: false, foreign_key: true
  end
end
