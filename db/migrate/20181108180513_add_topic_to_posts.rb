class AddTopicToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :topic_id, :integer
    add_index :posts, :topic_id
  end
end


# At #5, we see that the name we gave the migration, AddTopicToPosts, is very important. Using this specific naming format:
#
# "Add" + [table whose id we want to add] + "To" + [table we want to add the foreign key to]
# ...we instructed the generator to create a migration that adds a topic_id column to the posts table.
#
# At #6, we created an index on topic_id with the generator. An index improves the speed of operations on a database table.
