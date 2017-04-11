require "test_helper"

class AccountActivationsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get account_activations_controller_edit_url
    assert_response :success
  end

end
