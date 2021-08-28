require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  
  test "should not save Category without name and body" do
    category = Category.new
    category.name = "Chores"
    category.body = "Household"
    assert category.save
  end
end
