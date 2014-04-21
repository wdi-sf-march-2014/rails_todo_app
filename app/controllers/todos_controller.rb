class TodosController < ApplicationController

  def index
    # Retrieve a list of all the todo items from the database.
    # Prepares the @todos instance variable for the index.html.erb page.
    
    @todos = Todo.all
  end

  def new
    #Make an empty Todo object (@todo) for the form on the new.html.erb page.
    
    @todo = Todo.new
  end

  def create
    # Creates a todo item in the database with the information passed in
    # the params hash. Redirects to the show page.
    
    # binding.pry
    Todo.create todo_params
    redirect_to @todo
  end

  def show
    # Retrieves a specific item from the database. The id of the item is in
    # the params hash.  Place the item in the @todo instance variable for 
    # the show.html.erb page.

    # binding.pry
    @todo = Todo.find(params[:id])
  end

  def edit
    # Retrieves a specific item from the database. The id of the item is in
    # the params hash. Place the item in the @todo instance variable 
    # for the edit.html.erb page.

    # binding.pry
    @todo = Todo.find(params[:id])
  end

  def update
    # Retrieves a specific item from the database. The id of the item is in
    # the params hash. Updates the database with the contents of the params hash.
    # Redirects the view to the show page.

    # binding.pry
    @todo = Todo.find(params[:id])
    @todo.update todo_params
    redirect_to @todo
  end

  def destroy
   # Delete a single record in the database. 
   # Redirects the view to the index page.

   Todo.find(params[:id]).destroy
   redirect_to action: :index
  end

  private
    # Prepare the params hash for create and update methods.
    def todo_params
      params.require(:todo).permit(:title, :description)
    end
end
