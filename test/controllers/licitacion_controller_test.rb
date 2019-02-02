require 'test_helper'

class LicitacionControllerTest < ActionDispatch::IntegrationTest
  test "should get licitacion" do
    get licitacion_licitacion_url
    assert_response :success
  end

end
