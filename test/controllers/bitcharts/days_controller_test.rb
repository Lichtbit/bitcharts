require 'test_helper'

module Bitcharts
  class DaysControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "should get day numbers of months" do
      get :show, id: 'example'
      assert_response :success
      assert_includes response.body, '"labels":["Jan",'
      assert_includes response.body, '"data":[31,28,31'
    end

  end
end
