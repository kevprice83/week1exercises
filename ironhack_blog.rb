class Blog
	def initialize
		@blog_posts = []
	end

	def add_post(post)
		@blog_posts.push post
	end

	def publish_front_page
		@blog_posts.each do |post|
			if  post.sponsored
				puts "******#{post.title}********"
			else
				puts post.title
			end
			puts "***********"
			puts "#{post.date}: #{post.text}"
			puts "-----------"
		end
	end
end

class Post
	attr_accessor :title, :date, :text, :sponsored
	def initialize(title, date, text, sponsored)
		@title = title
		@date = date
		@text = text
		@sponsored = sponsored
	end
end

ironhack_blog = Blog.new
post1 = Post.new("I love Ruby", "16th June", "But it's so fucking confusing", false)
post2 = Post.new("Ruby blew my mind!", "15th June", "Soooo many functions within one method...", true)
post3 = Post.new("Progression", "14th June", "Baby steps.", false)
ironhack_blog.add_post(post1)
ironhack_blog.add_post(post2)
ironhack_blog.add_post(post3)
ironhack_blog.publish_front_page