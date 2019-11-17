require 'test_helper'

class FilterTest < ActiveSupport::TestCase
  test "should not match safe content" do
    assert_not Flaggable::Filter.match?('hello')
  end

  test "should not match safe content that is part of a profane phrase" do
    assert_not Flaggable::Filter.match?('window')
  end

  test "should match a profane word" do
    assert Flaggable::Filter.match?('5h1t')
  end

  test "should match a profane word without case sensitivity" do
    assert Flaggable::Filter.match?('5H1T')
  end

  test "should match a profane phrase" do
    assert Flaggable::Filter.match?('window licker')
  end

  test "should match profane content at the start of a line" do
    assert Flaggable::Filter.match?("\nshit hello")
  end

  test "should match profane content at the end of a line" do
    assert Flaggable::Filter.match?("what the shit\nis this")
  end

  test "should find a profane match in a block of text" do
    content = <<~CONTENT
    <p>Hopefully it'll make a difference as there's
    a SHIT TON of shipment to do...</p>
    CONTENT

    assert Flaggable::Filter.match?(content)
  end
end
