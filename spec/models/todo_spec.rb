require 'spec_helper'

describe Todo do
  it "should create a new instance given valid attributes" do
    todo = Todo.create(title: "my title", description: "my description")
    todo.should be_valid
  end 

  describe 'title' do
    it 'should not be empty' do
      todo = Todo.create(description: "my description")
      todo.should_not be_valid
      todo.errors[:title].should include("can't be blank")
    end
  end

  describe 'all_todos_modified_after' do
    it 'should not return todos modified before given date' do
      todo1 = Todo.create(title: "my title", description: "my description", updated_at: (Time.now - 4.days))
      todo2 = Todo.create(title: "my title", description: "my description", updated_at: (Time.now - 1.day))
      date = (Time.now - 2.days)
      Todo.all_todos_modified_after(date).should eq([todo2])
    end
  end

  describe 'description' do
    it 'should not be empty' do
      todo = Todo.create(title: "my title")
      todo.should_not be_valid
      todo.errors[:description].should include("can't be blank")
    end
  end

  describe 'alphabetize' do

    before do
      @todo1 = Todo.create(title: "a title",description: "my description")
      @todo2 = Todo.create(title: "b title",description: "my description")
      @todo3 = Todo.create(title: "c title",description: "my description")
    end

    it 'should return an array of todos alphbatized by title' do
      Todo.alphabetize.should eq [@todo1, @todo2, @todo3]
    end
  end

  describe 'outdated' do
    it 'should return todos created over a month ago' do
      todo1 = Todo.create(title: "a title",description: "my description")
      todo2 = Todo.create(title: "b title",description: "my description",
        created_at: (Time.now - 1.month))
      Todo.outdated.should eq([todo2])
    end
  end
end
