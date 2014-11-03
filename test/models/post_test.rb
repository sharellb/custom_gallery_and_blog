require 'test_helper'

class PostTest < ActiveSupport::TestCase
	post = Post.new
	assert_not post.save
end
