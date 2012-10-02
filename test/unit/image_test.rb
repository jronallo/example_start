require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test "the truth" do
    assert "An Image Title", images(:one).title
  end
end
