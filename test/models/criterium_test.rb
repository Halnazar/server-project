require "test_helper"

class CriteriumTest < ActiveSupport::TestCase
  test "should not save Criterium without field Name" do
        c = Criterium.new
        assert_not c.save
  end
end
