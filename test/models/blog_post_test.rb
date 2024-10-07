require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blog posts" do
    # assert draft_blog_post.draft? # Using the helper method
    # OR using the fixture
    assert blog_posts(:draft).draft?
  end

  test "draft? returns false for published blog posts" do
    assert_not blog_posts(:published).draft?
    # OR
    # refute BlogPost.new(published_at: 1.month.ago).draft?
  end

  test "draft? returns false for scheduled blog posts" do
    refute blog_posts(:scheduled).draft?
  end

  test "published? returns true for published blog posts" do
    assert blog_posts(:published).published?
  end

  test "published? returns false for draft blog posts" do
    refute draft_blog_post.published?
  end

  test "published? returns false for scheduled blog posts" do
    refute blog_posts(:scheduled).published?
  end

  test "scheduled? returns true for scheduled blog posts" do
    assert blog_posts(:scheduled).scheduled?
  end

  test "scheduled? returns false for draft blog posts" do
    refute draft_blog_post.scheduled?
  end

  test "scheduled? returns false for published blog posts" do
    refute blog_posts(:published).scheduled?
  end

  def draft_blog_post
    BlogPost.new(published_at: nil)
  end
end
