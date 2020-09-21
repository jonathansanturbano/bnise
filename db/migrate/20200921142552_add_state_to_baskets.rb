class AddStateToBaskets < ActiveRecord::Migration[6.0]
  def change
    add_column :baskets, :state, :string
  end
end
