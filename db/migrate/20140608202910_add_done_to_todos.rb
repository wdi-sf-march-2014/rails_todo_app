class AddDoneToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :done, :boolean, default: false

    # column to table Todos, label is Done, value type is Boolean, default value is false 
  end
end
