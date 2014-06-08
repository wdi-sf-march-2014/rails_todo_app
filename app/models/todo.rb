class Todo < ActiveRecord::Base
 def self.all_todos_modified_after(date)
    Todo.where("updated_at > ?", [date])
  end 
end

#### NOTES: ####

# MIGRATIONS: A migration keeps track of all the changes you've made in the database. 
# It allows developers to collaborate on the database without passing around SQL scripts.
