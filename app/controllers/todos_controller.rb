class TodosController < ApplicationController

  def index
    # Retrieve a list of all the todo items from the database.
    # Prepares the @todos instance variable for the index.html.erb page.
    
    @todos = Todo.all
    # binding.pry
    # Exercise 1: 
    # 1) Uncomment line 8 
    # 2) While in pry, go through the @todos instance variable and 
    #    print out the title of each todo item.
    # 3) Practice accessing the title with both coding styles:
    #    todos["title"] and todos.title. 
    # 4) Comment out line 8
    # 5) Which coding style do you like better?
    #    Which way do you think JavaScript does it? Can you find out?
    # 6) Comment out line 8.
  end

  def new
    # Makes an empty Todo object (@todo) for the form on the 
    # new.html.erb page.
    
    @todo = Todo.new
  end

  def create
    # Creates a todo item in the database with the information passed in
    # the params hash. Redirects to the show page using the todo_path
    # and passing the @todo object.
    
    # binding.pry
    @todo = Todo.create todo_params
    redirect_to todo_path(@todo)
  end

  def show
    # Retrieves a specific item from the database. The id of the item is in
    # the params hash.  Place the item in the @todo instance variable for 
    # the show.html.erb page.

    # binding.pry
    @todo = Todo.find(params[:id])
    # binding.pry
    # Exercise 2: 
    # 1) Uncomment line 43
    # 2) In pry, check the content of the params hash. What is params[:id]?
    # 3) Comment out line 43. Uncomment line 45.
    # 4) In pry, display the title and description of the @todo item.
    # 5) Comment out line 45.
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
    # the params hash. Updates the database with the contents of the params 
    # hash through the use of a private method. Redirects to the show page 
    # using the todo_path and passing the @todo object.

    # binding.pry
    @todo = Todo.find(params[:id])
    @todo.update todo_params
    redirect_to todo_path(@todo)
  end

  def destroy
   # Delete a single record in the database. 
   # Redirects the view to the root page using the root_path.

   # binding.pry
   Todo.find(params[:id]).destroy
   redirect_to root_path
  end

  def recent
    @todo = Todo.all
  end

  # Question: Active record query => Todo.where('created_at < ?', Date.today )

  private
    # Prepare the params hash for create and update methods.
    def todo_params
      params.require(:todo).permit(:title, :description)
    end
end
