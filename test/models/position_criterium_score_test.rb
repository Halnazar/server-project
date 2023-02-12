require "test_helper"

class PositionCriteriumScoreTest < ActiveSupport::TestCase
  test "should not save PositionCriteriumScore without field Score" do
        c = PositionCriteriumScore.new
        c.position_id = 1
        c.criterium_id = 1
        assert_not c.save
  end
end
