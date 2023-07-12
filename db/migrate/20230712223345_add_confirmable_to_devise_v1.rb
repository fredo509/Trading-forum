class AddConfirmableToDeviseV1 < ActiveRecord::Migration[7.0]
  def change
    change_table(:users) do |t|
      # Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
    end
    add_index :users, :confirmation_token, :unique => true
  end
end
