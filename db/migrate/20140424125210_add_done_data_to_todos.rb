class AddDoneDataToTodos < ActiveRecord::Migration
  def change
    Todo.all.each do |todo|
      todo.done = false
      todo.save
    end
  end
end
