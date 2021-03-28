class RemovePercentageFromStrain < ActiveRecord::Migration[6.0]
  def change
    remove_column :strains, :percentage
  end
end
