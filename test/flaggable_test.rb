require 'test_helper'

class Flaggable::Test < ActiveSupport::TestCase
  test "should be a module" do
    assert_kind_of Module, Flaggable
  end
end
