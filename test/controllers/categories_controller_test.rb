require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    def setup
        @category = Category.create(name: "sports")
    end
    
    test "should have action index" do
       get :index
       assert_response :success
    end
    
    test "should have action new" do
        get :new
        assert_response :success
    end
    
    test "should have action show" do
        get :show, {'id' => @category.id}
        assert_response :success
    end
    
end