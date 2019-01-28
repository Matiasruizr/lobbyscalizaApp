require 'test_helper'

class AudienciaControllerTest < ActionDispatch::IntegrationTest
  test "should get detalle" do
    get audiencia_detalle_url
    assert_response :success
  end

end
