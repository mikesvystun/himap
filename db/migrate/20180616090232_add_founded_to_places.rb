class AddFoundedToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :founded, :integer
  end
end
