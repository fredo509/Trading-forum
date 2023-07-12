# frozen_string_literal: true

class AddAddressToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :string
    add_index :users, :address
  end
end
