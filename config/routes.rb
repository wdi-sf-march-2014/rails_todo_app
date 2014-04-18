TodoApp::Application.routes.draw do
  
  get "todos/index"
  get "todos/new"
  get "todos/create"
  get "todos/show"
  get "todos/edit"
  get "todos/update"
  get "todos/destroy"
  
  # root 'controller_name#controller_method'
  # todos is the controller name
  # index is the method
  root 'todos#index'

  
end
