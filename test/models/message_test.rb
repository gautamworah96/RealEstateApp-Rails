require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #


  test "should not save" do
    m = Message.new
    assert_not m.save
  end

end
