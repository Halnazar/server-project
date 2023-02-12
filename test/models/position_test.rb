require "test_helper"

class PositionTest < ActiveSupport::TestCase
  test "should not save Position without field Name" do
        j = Position.new
        assert_not j.save
  end
end
