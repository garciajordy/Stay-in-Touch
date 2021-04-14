module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def friend_or_unfriend_btn(user)
    @user = User.find(user.id)
    friend = Friendship.where(user_id: user.id).where(friend_id: current_user.id).first
    pending = Friendship.where(user_id: current_user.id).where(friend_id: user.id).where(confirmed: nil).first
  if pending
    link_to('Pending', user_path(current_user), class: "btn btn-outline-warning btn-sm ml-3" )
    
  elsif friend
      link_to('Cancel', friendship_path(friend), class: "btn btn-outline-danger btn-sm ml-3", method: :delete)
  
    else
      link_to('Add friend', friendships_path(user), class: "btn btn-outline-success btn-sm ml-3", method: :post)
    end
  end
end
