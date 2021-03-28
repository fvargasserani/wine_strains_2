class RemoveAssemblyFromWine < ActiveRecord::Migration[6.0]
  def change
    remove_column :wines, :assembly, :boolean
  end
end
