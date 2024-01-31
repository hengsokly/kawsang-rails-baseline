# This migration comes from kawsang (originally 20240129064314)
class CreateKawsangUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :kawsang_users, id: :uuid do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      # Other columns
      t.integer   :role
      t.boolean   :actived, default: true
      t.datetime  :deleted_at
      t.string    :locale
      t.integer   :sign_in_type, default: 1
      t.string    :otp_token
      t.datetime  :otp_sent_at
      t.string    :tg_username

      t.timestamps
    end

    add_index :kawsang_users, :email,                unique: true
    add_index :kawsang_users, :reset_password_token, unique: true
    add_index :kawsang_users, :confirmation_token,   unique: true
    add_index :kawsang_users, :unlock_token,         unique: true
  end
end
