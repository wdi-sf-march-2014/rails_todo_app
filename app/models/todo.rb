class Todo < ActiveRecord::Base
  # Validating the title is present and the length of the title is between 2 and 200
  validates :title, presence: true, length: {minimum: 2, maximum: 200}
  # Valdiating that there is some description.
  validates :description, presence: true

  # We could also validate based on format of the data using a regular expression.

  def self.all_todos_modified_after(date)
    Todo.where("updated_at > ?", [date])
  end
end