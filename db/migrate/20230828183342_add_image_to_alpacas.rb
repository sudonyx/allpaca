class AddImageToAlpacas < ActiveRecord::Migration[7.0]
  def change
    add_column :alpacas, :image, :string
  end
end
