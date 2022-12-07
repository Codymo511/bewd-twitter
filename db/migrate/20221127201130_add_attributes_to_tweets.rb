class AddAttributesToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweet, :message, :string
    add_column :tweet, :user_id, :integer
  end
end
