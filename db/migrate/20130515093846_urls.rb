class Urls < ActiveRecord::Migration
  def change

    create_table :urls do |t|
      t.integer :click_count, :default => 0
      t.string :short_url
      t.string :long_url
    end
  end
end
