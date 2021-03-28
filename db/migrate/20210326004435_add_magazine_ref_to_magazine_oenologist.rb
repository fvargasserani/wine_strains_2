class AddMagazineRefToMagazineOenologist < ActiveRecord::Migration[6.0]
  def change
    add_reference :magazine_oenologists, :magazine, null: false, foreign_key: true
  end
end
