require 'test_helper'

class Flaggable::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Flaggable
  end
end
