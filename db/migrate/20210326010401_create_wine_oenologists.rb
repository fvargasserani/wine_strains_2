class CreateWineOenologists < ActiveRecord::Migration[6.0]
  def change
    create_table :wine_oenologists do |t|
      t.integer :grade

      t.timestamps
    end
  end
end
