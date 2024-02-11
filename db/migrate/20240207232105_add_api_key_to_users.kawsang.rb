# This migration comes from kawsang (originally 20240207030445)
class AddApiKeyToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :kawsang_users, :api_key, :string
  end
end
