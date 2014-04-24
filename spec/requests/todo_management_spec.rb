require 'spec_helper'

describe "Todos Management" do 

  describe 'creating a new todo' do

    it 'renders form and creates a new todo' do
      get "/todos/new"
      expect(response).to render_template(:new)

      post "/todos", :todo => {:title => "My Todo", description: "Do Things"}

      expect(response).to redirect_to(assigns(:todo))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("Do Things")
    end

  end

  describe 'listing recent todos' do
    it 'lists recent todos at path /recent' do
      todo = Todo.create(title: "my title", description: "my description")

      get "/recent"
      expect(response).to render_template(:recent)

      expect(response.body).to include("my title")
    end
  end
end