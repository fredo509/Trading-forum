# frozen_string_literal: true

class AddAddressToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :address, :string
    add_index :posts, :address
  end
end
