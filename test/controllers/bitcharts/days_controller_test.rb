require 'test_helper'

module Bitcharts
  class DaysControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "should get day numbers of months" do
      get :show, id: 'example_1'
      assert_response :success
      assert_includes response.body, '"labels":["2016-01-01","2016-01-02"'
      assert_includes response.body, '"data":[20,31,0'
    end

  end
end
