class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweet do |t|

      t.timestamps
    end
  end
end
