require "test_helper"

class ElbControllerTest < ActionDispatch::IntegrationTest
  test "should get health_check" do
    get elb_health_check_url
    assert_response :success
  end
end
