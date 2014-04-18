class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create

  end

  def show
    puts "@@@@@@@@@@@@@Params hash:#{params.inspect}"
    puts "#{params["id"]}"
    @todo = Todo.find(params["id"])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
