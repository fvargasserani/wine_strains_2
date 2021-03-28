class AddStrainRefToWineStrain < ActiveRecord::Migration[6.0]
  def change
    add_reference :wine_strains, :strain, null: false, foreign_key: true
  end
end
