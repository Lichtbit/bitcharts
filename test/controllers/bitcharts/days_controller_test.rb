require 'test_helper'

module Bitcharts
  class DaysControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "should return labels and values for the last 7 days" do
      get :show, id: 'example_1'
      assert_response :success
      assert_includes response.body, '"labels":["' + 7.days.ago.to_date.to_s
      assert_includes response.body, Date.today.to_s + '"]'
      assert_includes response.body, '"data":[0,0,0'
    end

    test "should consider from and to params" do
      get :show, id: 'example_1', from: '2015-12-31', to: '2016-01-01'
      assert_response :success
      assert_includes response.body, '"labels":["2015-12-31","2016-01-01"]'
      assert_includes response.body, '"data":[0,20]'
    end

    test "should ignore invalid dates" do
      get :show, id: 'example_1'
      assert_response :success, from: '2015-13-31', to: 'abc'
      assert_includes response.body, '"labels":["' + 7.days.ago.to_date.to_s
      assert_includes response.body, Date.today.to_s + '"]'
    end

  end
end
