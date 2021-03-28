class AddWineRefToWineStrain < ActiveRecord::Migration[6.0]
  def change
    add_reference :wine_strains, :wine, null: false, foreign_key: true
  end
end
