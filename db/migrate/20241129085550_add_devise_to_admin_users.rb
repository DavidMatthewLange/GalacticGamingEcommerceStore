# frozen_string_literal: true

class AddDeviseToAdminUsers < ActiveRecord::Migration[7.2]
  def self.up
    change_table :admin_users do |t|
      # Only add email column if it doesn't already exist
      unless column_exists?(:admin_users, :email)
        t.string :email, null: false, default: ""
      end

      # Only add encrypted_password column if it doesn't already exist
      unless column_exists?(:admin_users, :encrypted_password)
        t.string :encrypted_password, null: false, default: ""
      end

      # Only add other columns if they don't already exist
      unless column_exists?(:admin_users, :reset_password_token)
        t.string   :reset_password_token
      end

      unless column_exists?(:admin_users, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end

      unless column_exists?(:admin_users, :remember_created_at)
        t.datetime :remember_created_at
      end
    end

    add_index :admin_users, :email, unique: true unless index_exists?(:admin_users, :email)
    add_index :admin_users, :reset_password_token, unique: true unless index_exists?(:admin_users, :reset_password_token)
  end

  def self.down
    # If you need to reverse the migration, remove the columns and indexes
    change_table :admin_users do |t|
      t.remove :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
    end

    remove_index :admin_users, :email if index_exists?(:admin_users, :email)
    remove_index :admin_users, :reset_password_token if index_exists?(:admin_users, :reset_password_token)
  end
end
