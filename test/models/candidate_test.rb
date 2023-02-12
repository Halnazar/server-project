require "test_helper"

class CandidateTest < ActiveSupport::TestCase

  test "should not save Candidate without field vacancy_id" do
        c = Candidate.new
        c.first_name = "AAA"
        c.second_name = "BBB"
        c.biography = "Some text"
        c.gender = 0
        assert_not c.save
  end

end
