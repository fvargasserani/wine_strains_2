class AddOenologistRefToMagazineOenologist < ActiveRecord::Migration[6.0]
  def change
    add_reference :magazine_oenologists, :oenologist, null: false, foreign_key: true
  end
end
