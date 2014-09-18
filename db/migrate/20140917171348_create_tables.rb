class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :provider, null: false
    	t.string :uid, null: false
    	t.string :username, null: false
    	t.string :url, null: false

    	t.timestamps
    end

    create_table :questions do |t|
    	t.string :title, null: false
    	t.string :description, null: false

    	t.timestamps
    end

    create_table :answers do |t|
    	t.string :description, null: false

    	t.timestamps
    end
  end
end
