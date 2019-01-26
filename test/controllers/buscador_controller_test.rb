require 'test_helper'

class BuscadorControllerTest < ActionDispatch::IntegrationTest
  test "should get buscador" do
    get buscador_buscador_url
    assert_response :success
  end

end
