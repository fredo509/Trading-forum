# frozen_string_literal: true 



first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         id: 100, role: 'admin', email: 'tom@example.com', username: 'Tommy', password: '123456')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                          id: 200, email: 'lilly@example.com', username: 'Lillou', password: '123456')

4.times do
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

  # Verify the post creation
  puts "Post Title: #{first_post.title}"
  puts "Post Author: #{first_post.author.name}"

  # Create comments
  Comment.create(post: first_post, author: second_user, text: 'Hi Tom!', author_id: 100)
  Comment.create(post: first_post, author: second_user, text: 'Nice post!', author_id: 100)
  Comment.create(post: first_post, author: second_user, text: 'Keep it up!', author_id: 100)
  Comment.create(post: first_post, author: second_user, text: 'Great work!', author_id: 100)
  Comment.create(post: first_post, author: second_user, text: 'Awesome!', author_id: 100)
  Comment.create(post: first_post, author: second_user, text: 'Well done!', author_id: 1)

  # Verify the comments
  puts "Comments for Post: #{first_post.comments.count}"
end

# Find, update, and delete entities
user = User.find_by(name: 'Tom')
puts "User: #{user.name}"
user.update(name: 'Tom Smith')
updated_user = User.find_by(name: 'Tom Smith')
puts "Updated User: #{updated_user.name}"

post = updated_user.posts.find_by(title: 'Hello')
puts "Post Title: #{post.title}" if post
post&.update(title: 'Greetings', text: 'This is my updated post')
updated_post = updated_user.posts.find_by(title: 'Greetings')
puts "Updated Post Title: #{updated_post.title}" if updated_post

comment = updated_post.comments.find_by(text: 'Hi Tom!') if updated_post
puts "Comment Text: #{comment.text}" if comment
comment&.destroy
puts "Comment Count after deletion: #{updated_post.comments.count}" if updated_post

# Call the methods
recent_posts = user.recent_posts
puts "Recent Posts for User: #{user.name}"
recent_posts.each do |post|
  puts "Title: #{post.title}, Text: #{post.text}"
end

updated_user.update_posts_counter
puts "Posts Counter for User: #{updated_user.name} - #{updated_user.posts_counter}"

recent_comments = updated_post.recent_comments
puts "Recent Comments for Post: #{updated_post.title}"
recent_comments.each do |comment|
  puts "Text: #{comment.text}"
end

updated_post.update_comments_counter
puts "Comments Counter for Post: #{updated_post.title} - #{updated_post.comments_counter}"

updated_post.update_likes_counter
puts "Likes Counter for Post: #{updated_post.title} - #{updated_post.likes_counter}"
