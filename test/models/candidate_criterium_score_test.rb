require "test_helper"

class CandidateCriteriumScoreTest < ActiveSupport::TestCase
  test "should not save CandidateCriteriumScore without field Score" do
        c = CandidateCriteriumScore.new
        c.candidate_id = 1
        c.criterium_id = 1
        assert_not c.save
  end
end
