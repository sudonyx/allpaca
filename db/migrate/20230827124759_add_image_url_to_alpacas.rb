class AddImageUrlToAlpacas < ActiveRecord::Migration[7.0]
  def change
    add_column :alpacas, :image_url, :string
  end
end
