class TodosController < ApplicationController

  def index
    # Retrieve a list of all the todo items from the database.
    @todos = Todo.all
  end

  def new
    #Make an empty Todo object for the form
    @todo = Todo.new
  end

  def create
    # Take new page data (todo object) and save it to the database.
    # binding.pry

    Todo.create todo_params
    redirect_to action: :index
  end

  def show
    # Retrieve a single item from the database for the show page.
    # binding.pry
    @todo = Todo.find(params[:id])
  end

  def edit
    # Retrieve a single item from the database for the edit page.
    # binding.pry
    @todo = Todo.find(params[:id])
  end

  def update
    # Take edit page changes (todo object) and update the database.

    # binding.pry
    @todo = Todo.find(params[:id])
    @todo.update todo_params
    redirect_to @todo
  end

  def destroy
   # Delete a single record in the database.
   Todo.find(params[:id]).destroy
    redirect_to action: :index
  end

  private
    # Prepare the params hash for create and update methods.
    def todo_params
      params.require(:todo).permit(:title, :description)
    end
end
