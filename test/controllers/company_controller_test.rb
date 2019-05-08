require 'test_helper'

class CompanyControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get company_destroy_url
    assert_response :success
  end

end
