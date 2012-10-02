require 'test_helper'

class ImagesTest < ActionDispatch::IntegrationTest

  # Heading tests
  test "Home page should have Images heading" do
    visit(root_path)
    assert page.find("h1").has_content?('Images')
  end
  test "images index page should have Images heading" do
    visit(images_path)
    assert page.find("h1").has_content?('Images')
  end

  # Image display on index page
  test "images index page should list out an image title" do
    visit(images_path)
    assert page.has_content?("An Image Title")
  end
  
end
