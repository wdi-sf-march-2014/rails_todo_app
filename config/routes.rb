TodoApp::Application.routes.draw do
  
  # root 'controller_name#controller_method'
  # todos is the controller name
  # index is the method
  root 'todos#index'

  resources :todos

#Spencers-MacBook-Pro-2:todo_app Spencer$ rake routes
#    Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         todos#index
#     todos GET    /todos(.:format)          todos#index
#           POST   /todos(.:format)          todos#create
#  new_todo GET    /todos/new(.:format)      todos#new
# edit_todo GET    /todos/:id/edit(.:format) todos#edit
#      todo GET    /todos/:id(.:format)      todos#show
#           PATCH  /todos/:id(.:format)      todos#update
#           PUT    /todos/:id(.:format)      todos#update
#           DELETE /todos/:id(.:format)      todos#destroy


end
