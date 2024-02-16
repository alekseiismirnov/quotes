class RemoveBioFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :bio, :string
  end
end
