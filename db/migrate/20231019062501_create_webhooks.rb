class CreateWebhooks < ActiveRecord::Migration[6.1]
  def change
    create_table :webhooks do |t|
      t.string :user_id
      t.string :create_url
      t.string :update_url
      t.boolean :status

      t.timestamps
    end

    def change
    	add_column :inventories, :user_id, :integer
    end
  end
end
