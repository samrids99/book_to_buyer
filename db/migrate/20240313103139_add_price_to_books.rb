class AddPriceToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :price, :float
  end
end
