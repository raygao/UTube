class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :provider
      t.text :uid
      t.text :access_token
      t.text :secret

      t.timestamps
    end
  end
end
