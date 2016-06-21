require 'test_helper'

module Bitcharts
  class DaysControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "should return labels and values for Jan 2016" do
      get :show, id: 'example_1'
      assert_response :success
      assert_includes response.body, '"labels":["2016-01-01","2016-01-02"'
      assert_includes response.body, '"data":[20,31,0'
    end

    test "should consider from and to params" do
      get :show, id: 'example_1', from: '2015-08-31', to: '2015-09-01'
      assert_response :success
      assert_includes response.body, '"labels":["2015-08-31","2015-09-01"]'
      assert_includes response.body, '"data":[0,0]'
    end

  end
end
