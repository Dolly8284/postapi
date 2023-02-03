require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get dashbord" do
    get members_dashbord_url
    assert_response :success
  end
end
