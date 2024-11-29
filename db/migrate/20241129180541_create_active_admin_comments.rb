class CreateActiveAdminComments < ActiveRecord::Migration[6.1]
  def change
    create_table :active_admin_comments do |t|
      t.string :namespace
      t.text :body
      t.string :resource_type
      t.bigint :resource_id
      t.string :author_type
      t.bigint :author_id
      t.timestamps
    end

    add_index :active_admin_comments, [ :namespace ]
    add_index :active_admin_comments, [ :resource_type, :resource_id ]
    add_index :active_admin_comments, [ :author_type, :author_id ]
  end
end
