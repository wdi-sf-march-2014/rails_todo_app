class Todo < ActiveRecord::Base
 def self.all_todos_modified_after(date)
    Todo.where("updated_at > ?", [date])
  end 
end

#### NOTES: ####

# MIGRATIONS: A migration keeps track of all the changes you've made in the database. 
# It allows developers to collaborate on the database without passing around SQL scripts.

# VALIDATION: Validating that some pieces of data are present. 
# Validations are used to ensure that only valid data is saved into your database. 
# For example, it may be important to your application to ensure that every user provides 
# a valid email address and mailing address

# Difference between save and save! => save will return false if record can't be saved. Save! will throw
# throw an exception if record is invalid. 
