class AddDoneDataToTodos < ActiveRecord::Migration
  def change
    todo = Todo.all
    todo.done = false
    todo.save
  end
end
