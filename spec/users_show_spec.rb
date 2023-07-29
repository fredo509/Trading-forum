# frozen_string_literal: true

require 'rails_helper'
Capybara.default_max_wait_time = 5
RSpec.describe 'User Show Page', type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(
      name: 'Fredo',
      photo: 'https://unsplash.com/es/fotos/04OtkxJTQR4',
      bio: 'Life is awesome 1',
      posts_counter: 4
    )
    @post1 = Post.create(
      title: 'Life 1',
      text: 'Life is awesome 1',
      comments_counter: 5,
      likes_counter: 13,
      author: @user
    )
    @post2 = Post.create(
      title: 'Life 2',
      text: 'Life is awesome 2',
      comments_counter: 5,
      likes_counter: 13,
      author: @user
    )
    @post3 = Post.create(
      title: 'Life 3',
      text: 'Life is awesome 3',
      comments_counter: 5,
      likes_counter: 13,
      author: @user
    )
    visit user_path(id: @user.id)
  end
  it "displays the user's profile picture" do
    expect(page.has_xpath?("//img[@src = 'https://unsplash.com/es/fotos/04OtkxJTQR4' ]"))
  end
  it "displays the user's username" do
    expect(page).to have_content(@user.name)
  end
  it 'shows the number of posts the user has written' do
    expect(page).to have_content(@user.posts_counter)
  end
  it "shows the user's bio" do
    expect(page).to have_content(@user.bio)
  end
  it 'shows the first 3 posts of the user' do
    @user.recent_posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
      expect(page).to have_content(post.comments_counter)
      expect(page).to have_content(post.likes_counter)
    end
  end
  it "is redirected to that post's show page." do
    click_link(@post1.title, href: "/users/#{@user.id}/posts/#{@post1.id}")
    expect(page).to have_current_path(user_post_path(@post1.author, @post1))
  end
  it "redirects me to the user's posts index page on clicking to see all posts" do
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
