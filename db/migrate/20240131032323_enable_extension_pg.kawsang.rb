# This migration comes from kawsang (originally 20240129064313)
class EnableExtensionPg < ActiveRecord::Migration[7.1]
  def change
    # Enhances the security capabilities of PostgreSQL
    enable_extension "pgcrypto"
    # Support uuid
    enable_extension "uuid-ossp"
  end
end
