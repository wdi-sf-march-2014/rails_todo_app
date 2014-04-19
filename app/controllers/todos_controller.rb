class TodosController < ApplicationController
  
  def index
    # Retrieve a list of all the todo items from the database.
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    # Take new page data (todo object) and save it to the database.
    # binding.pry

    # Rails 4 way
    # @todo.create(todo_params)
    
    # Rails 3 way
    Todo.create(title: params[:todo][:title], description: params[:todo][:description])
    redirect_to action: :index
    
    # Marcus code:
    # redirect_to action: :show,  id: movie["imdbID"]
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
    # if @user.update_attributes(user_params)
    #   flash[:success] = "Profile updated"
    #   sign_in @user
    #   redirect_to @user
    # else
    #   render 'edit'
    # end

    # Take edit page changes (todo object) and update the database.

    # Rails 4 style
    # @todo.update_attributes(todo_params)
    # Rails 3 style
    # binding.pry
    Todo.update(title: params[:todo][:title], description: params[:todo][:description])
    redirect_to action: :index
  end

  def destroy
    # User.find(params[:id]).destroy
    # flash[:success] = "User destroyed."
    # redirect_to users_url

    # Delete a single record in the database.
    Todo.delete(params[:id])
    redirect_to action: :index
  end

  private

    # def user_params
    #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
    # end

    # Prepare the params hash for create and update methods.
    def todo_params
      # binding.pry
      params.require(:todo).permit(:title, :description)
    end
end
