require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    
    def setup
        @category = Category.new(name: "sports")
    end
    
    test "category should be valid" do
        assert @category.valid?
    end
    
    test "category name should be present" do
        @category.name = ""
        assert_not @category.valid?
    end
    
    test "category name should be unique" do
        @category.save
        @category2 = Category.new(name: "sports")
        assert_not @category2.valid?
    end
    
    test "category name should not exceed 20 chars" do
       @category.name = "a"*26
       assert_not @category.valid?
    end
    
    test "category name should atleast have 3 chars" do
        @category.name = "a"
        assert_not @category.valid?
    end
end