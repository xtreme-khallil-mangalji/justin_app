class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :title
      t.string :text
      t.string :image_url

      t.timestamps
    end
  end
end
