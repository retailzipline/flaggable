require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  fixtures :comments

  test "should flag profane content on create" do
    assert_difference "Flaggable::FlaggedItem.count" do
      Comment.create(body: 'what the shit')
    end
  end

  test "should flag profane content on update" do
    assert_difference "Flaggable::FlaggedItem.count" do
      comments(:clean).update(body: 'what the shit')
    end
  end
end
