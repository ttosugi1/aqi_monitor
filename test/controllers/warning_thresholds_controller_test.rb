require "test_helper"

class WarningThresholdsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get warning_thresholds_index_url
    assert_response :success
  end
end
