class Todo < ActiveRecord::Base
 
  def self.all_todos_modified_after(date)
    Todo.where("updated_at > ?", [date])
  end
end
