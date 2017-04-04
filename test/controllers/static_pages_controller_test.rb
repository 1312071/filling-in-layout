require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
def setup
	@base_title = "Ruby on Rails Tutorial Sample App"
end

=begin
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end
=end



  test "should get help" do
    get helf_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"

  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
  	get contact_path
  	assert_response :success
  	assert_select "title", "Contact | #{@base_title}"
  end

  test "shoul get root" do
  	get root_path
  	assert_response :success
  	assert_select "title", "#{@base_title}"
  end


end
