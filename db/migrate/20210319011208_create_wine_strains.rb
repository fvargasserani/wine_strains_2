class CreateWineStrains < ActiveRecord::Migration[6.0]
  def change
    create_table :wine_strains do |t|

      t.timestamps
    end
  end
end
