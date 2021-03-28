class CreateMagazineOenologists < ActiveRecord::Migration[6.0]
  def change
    create_table :magazine_oenologists do |t|

      t.timestamps
    end
  end
end
