require 'test_helper'

class BulletinsControllerTest < ActiveSupport::TestCase
  def test_index
    assert Bulletin.count == 2
  end

  def test_show
    assert_not_nil Bulletin.find_by(title: 'My first fixture')
  end
end
